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

	// XML �\�[�X�����[�h����
	$xml = new DOMDocument;
	$xml->load($logfilename);

	$xsl = new DOMDocument;
	$xsl->load('svnlog2rss.xsl');

	// �ϊ��̐ݒ���s��
	$proc = new XSLTProcessor;
	// XSL ���[����K�p����
	$proc->importStyleSheet($xsl);

	echo $proc->transformToXML($xml);
?>
