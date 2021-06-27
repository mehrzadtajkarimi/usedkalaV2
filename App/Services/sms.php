<?php
function send_sms($tell = 0, $text = '')
{

	// developing mode 
	// mysqli_query($CON,"INSERT INTO `sent_sms` (`cellphone`,`body`,`date`,`whitesms_result`) VALUES ('0".$tell."','$text','".time()."','developing mode: this data only added here')");
	// mysqli_close($CON);
	// return true;
	// end of developing mode

	// is_array($tell) ?? [$tell];
	// is_array($text) ?? [$text];
	// var_dump($text);die;


	if (!is_array($tell)) $tell = [$tell];
	if (!is_array($text)) $text = [$text];
	//var_dump($text);
	// return false;

	$postData = [
		'UserApiKey' => 'cf3debbd4d42fa30f4dfebbd',
		'SecretKey' => 'L0rem!1!1',
		'System' => 'php_rest_v_2_0'
	];
	$ch = curl_init('https://ws.sms.ir/api/Token');
	curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
	$result = curl_exec($ch);
	//return ($result);
	curl_close($ch);
	$result = json_decode($result, true);


	$postData = [
		'Messages' => $text,
		'MobileNumbers' => $tell,
		'LineNumber' => 10000088844430
	];
	$ch = curl_init('https://ws.sms.ir/api/MessageSend');
	curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json', 'x-sms-ir-secure-token: ' . $result['TokenKey']]);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
	$result = curl_exec($ch);
	curl_close($ch);

	return ($result);
}
// echo send_sms('9128897603 ', '1234');
function sms_getDeliveryReport($id = 0)
{
	$query = mysqli_query($CON, "SELECT * FROM `sent_sms` WHERE `ID` = '$id'");
	$row = mysqli_fetch_assoc($query);
	$details = json_decode($row['whitesms_result'], true);

	$postData = [
		'UserApiKey' => 'cf3debbd4d42fa30f4dfebbd',
		'SecretKey' => 'L0rem!1!1',
		'System' => 'php_rest_v_2_0'
	];
	$ch = curl_init('https://ws.sms.ir/api/Token');
	curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
	$result = curl_exec($ch);
	curl_close($ch);
	$result = json_decode($result, true);

	$ch = curl_init('https://ws.sms.ir/api/MessageSend?pageId=0&batchKey=' . $details['BatchKey']);
	curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json', 'x-sms-ir-secure-token: ' . $result['TokenKey']]);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
	$result = curl_exec($ch);
	curl_close($ch);
	$resultObj = json_decode($result, true);

	$deliveryFromDB = json_decode($row['delivery_report'], true);
	if ($deliveryFromDB != NULL) {
		array_push($deliveryFromDB, $resultObj);
		// $newDelivery=[$deliveryFromDB,$resultObj];
	} else
		$deliveryFromDB = $resultObj;

	mysqli_query($CON, "UPDATE `sent_sms` SET `delivery_report` = '" . json_encode($deliveryFromDB, JSON_UNESCAPED_UNICODE) . "' , `report_date` = '" . time() . "' WHERE `ID` = '$id'");
	$return = "";
	foreach ($resultObj['Messages'] as $singleItem)
		$return = $return . $singleItem['MobileNo'] . "<br>" . $singleItem['DeliveryStatus'] . "<br><br>";
	$return = mb_substr($return, 0, -8, 'utf-8');
	if ($return != "") return ($return);
	else return ($result);
}
if (isset($_GET['delivery']) && is_numeric($_GET['delivery']))
	echo sms_getDeliveryReport($_GET['delivery']);
	
// sms_send('09199837091','test');
