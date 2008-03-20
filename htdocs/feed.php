<?php
	if (!isset($_GET['repos'])) {
		header("HTTP/1.1 404 Not Found");
		return;
	}

	$logfilename = 'svnlog_'.$_GET['repos'].'.xml';
	if(!file_exists($logfilename)) {
		header("HTTP/1.1 404 Not Found");
		return;
	}

	header('Content-type: text/xml; charset=UTF-8');

	// XML ソースをロードする
	$xml = new DOMDocument;
	$xml->load($logfilename);

	$xsl = new DOMDocument;
	$xsl->load('svnlog2rss.xsl');

	// 変換の設定を行う
	$proc = new XSLTProcessor;
	// XSL ルールを適用する
	$proc->importStyleSheet($xsl);

	echo $proc->transformToXML($xml);
?>
