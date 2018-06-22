---
layout: post
title: "php-xmlrpc"
date: 2016-9-9
---
    function rpc_client_call($host, $port, $rpc_server, $request) { 
       $contents = RPC_CALL_FAIL;
       $finishCall = false;
       
       global $GLOBAL_RPC_TIMEOUT;
       $fp = fsockopen($host, $port, $errno, $errstr, 3);

       if($fp)
       {
           stream_set_timeout($fp, $GLOBAL_RPC_TIMEOUT);
           $query = "POST $rpc_server HTTP/1.0\nUser-Agent: XML-RPC Client\nHost: ".$host."\nContent-Type: text/xml\nContent-Length: ".strlen($request)."\n\n".$request."\n";
           fwrite($fp, $query);
           
           $info = stream_get_meta_data($fp);
           
           if ($info["timed_out"]) {
               return $contents;
           }
           while (!$info["timed_out"]) {
               if (!feof($fp)){
                   $contents .= fgets($fp);
               } else {
                   $finishCall = true;
                   break;
               }
               $info = stream_get_meta_data($fp);
           }
           fclose($fp);
       }
       if ($finishCall) {
           return $contents;
       } else {
           return RPC_CALL_FAIL;
       }
    }


    function rpc_internal_call($ip, $port, $rpc_name, $arg_list, &$response) {
        $rpc_port = $port;
        $rpc_server = "/RPC2";
        $paramStr = "";
        if ($arg_list==null) {
            $paramStr = null;
        } else {
            foreach ($arg_list as $key=>$value) {
                $paramStr = $paramStr.$key.SEPARATOR_KEY.$value.SEPARATOR_PARAM;
            }
        }
        $output_options = array(
                "output_type" => "xml",
                "verbosity" => "pretty",
                "escaping" => array("markup"),
                "version" => "xmlrpc",
                "encoding" => "utf-8"
        );
        
        $request = xmlrpc_encode_request($rpc_name, $paramStr, $output_options);
        //echo $request;
        $resp = rpc_client_call($ip, $rpc_port, $rpc_server, $request);

        if ($resp == "-1") {
            return RPC_CALL_FAIL;
        }
        
        //echo $resp;

        $split = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        $xml =  explode($split, $resp);
        $xml = $split.array_pop($xml);
        $response = xmlrpc_decode($xml);
        return RPC_CALL_SUCCESS;

    }


    function rpc_work_call($ip,$rpc_name, $arg_list, &$response) {
        if (ereg("^[A-F0-9]{32}$", $ip)){ // proxy;
            return rpc_internal_proxy_call($ip,$rpc_name, $arg_list, $response);
        } else {
            global $GLOBAL_WORK_RPC_PORT;
            $port = $GLOBAL_WORK_RPC_PORT;
            $newIp = $ip;
            
            $portPos = strpos($ip, ":");
            if ($portPos !== false) {
                $newIp = substr($ip, 0, $portPos);
                $port = intval(substr($ip, $portPos+1, (strlen($ip) - 1 - $portPos )));
            }
            return rpc_internal_call($newIp, $port, $rpc_name, $arg_list, $response);
        }
    }


    function rpc_common_version($host, &$param, $rpc, $rpc_func) {
        $response = "";
        $newParam = array();
        if (isset($param["cc_uuid"])) {
            $newParam["cc_uuid"] = $param["cc_uuid"];
        } else {
            $newParam["cc_uuid"] = $_COOKIE["cc_uuid"];
        }
        if (isset($param["wk_uuid"])) {
            $newParam["wk_uuid"] = $param["wk_uuid"];
        } else if (isset($param["bk_uuid"])) {
            $newParam["bk_uuid"] = $param["bk_uuid"];
        }
        $errCode = $rpc_func($host, $rpc, $newParam, $response);
        if ($errCode!=RPC_CALL_SUCCESS || $response==RPC_ERROR_STRING) {
            log_rpc_fail($host, $rpc, $param, $newParam, $response, $errCode);
            if ($errCode==RPC_CALL_SUCCESS) {
                return $response;
            } else {
                return $errCode;
            }
        }
        $ret = "";
        $doc = new DOMDocument();
        if ($doc->loadXML($response)) {
                    
                    print_r($response);
                    exit();
                    
            $versions = $doc->getElementsByTagName("version");
            foreach ($versions as $ver) {
                $ret = $ver->getAttribute( "info" );
                break;
            }
        }
        return $ret;
    }


    function rpc_wk_version($host, &$param) {
        $rpc = "rpc.wk_version";
        $rpc_func = "rpc_work_call";
        unset($param["bk_uuid"]);
        return rpc_common_version($host, $param, $rpc, $rpc_func);
    }