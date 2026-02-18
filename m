Return-Path: <kernel-janitors+bounces-10199-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDPlMymclWmsSgIAu9opvQ
	(envelope-from <kernel-janitors+bounces-10199-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Feb 2026 12:02:01 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 78177155C35
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Feb 2026 12:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44244301673E
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Feb 2026 11:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C84307AE4;
	Wed, 18 Feb 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWRPPPEW"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B10A2D8396
	for <kernel-janitors@vger.kernel.org>; Wed, 18 Feb 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412513; cv=none; b=ZbflK4YxutrCNT1AXK9iIQUzkCcyJcmQAtAoXXB1q28dD10X4l53dyI+UyYqcPq1bMtIL+iB6c7h23h+qrGCigDpmh/IWms+fJg5VnODcZNwhT/cVfueLYfz3QsDMjyGhcJ5HUP/7P+EyhYtajAt+o2rIHzZHWjJI0ET/EbcbIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412513; c=relaxed/simple;
	bh=mtJ7tmHpf4O0rAYDjo0ur8EJ65nUAAHFMbS0duMHe3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E1pJ5pqe0VZ/XcCvLmXtiQY+lPxF3xUDgRSrbgriSQzXxi+I6+ykZLsgWEjNZ/JFIuJ+bleTr9jm4iSX3WiAV1KtVIiGFhMoaDif8YYRXDPvHvV+evkSaHIabL4owdkbCjJS2w9Nqjk2y00PNZg/ayg3msx29em8zp7sqfDOt7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWRPPPEW; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824a829f9bbso2705906b3a.0
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Feb 2026 03:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771412512; x=1772017312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEh2x9C41ySCmS9IgH4my6kPFolL4MAILeh/ncPke2I=;
        b=DWRPPPEWOb6paBL3I2g9Z6WqYHMdoyehrfoFzYajLBSEHerwYRxi11ImGpCv9Of98c
         uqpruC9BMTf7DAEkAqZu5VwgdYNcXxbyvcqRWaPqOav805BfROlqs6bgUfHYX73ZytX0
         +jnSeT6mtxHAhXgb4MYVj30tV2ZcTfyt200n1mCk2NpGHsUq/yXWsonksw7jSn4jnfU2
         SwnMixsbyzHoRBKnvI1o1h1QcqnMbeZKLihGbkg5Y7OD/VlEz05br30yJjYOI2agDjxs
         NcTK6uK4JmUmt8QQsfpV3Yu1xV+29SoTzlyAtlzXFTV+zR7U7DrTmasxDQaDOlJU7V12
         hWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771412512; x=1772017312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEh2x9C41ySCmS9IgH4my6kPFolL4MAILeh/ncPke2I=;
        b=Rp5ePlGY9NPRXRqeKgi/t5f2o0O+BZrIeDn4yt/hAnUtadgMC6YOXy6fp31/iN7ZHo
         Y6odDULBTDaCpbUjx2l2lYuyRSCFAnYCHr9S84aThOcO6+t+1hSWDsbBfT8Ps2twX2iu
         5qvCtMoBhAs7eoWf7uaOLyXbT6R45ULdV8hgG872ZlYvu+LsGlN49w2LhNnDTsmDKdCl
         YvNP6uTQKXLs5z80phGH4YqdBlpoS2UUU3Z/oJunVdvcVelSSCa0jeDsyFhiHk/wH5NI
         xzd8cSThlpYwtVSIG8pxw9ryr7RO2f/JEE+mxvgdz40ChOIkMPCkRxZvVLoBMuxdfr7L
         szaA==
X-Forwarded-Encrypted: i=1; AJvYcCXCynXcB4bdeYgMbxezuyww0OOJAvzMApz/DMFrrzqOJJWw/tWmCR6jD+dVvKCYd1mBj8T/V2oM1OsMkYXa1OY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Gm8aqvtuFUFIRoPJk6jHcIq8bRzXwBNEcVCmCWgq12NTcWN3
	L5holBh1BpLfsEvQ+jetzUjjB+bhnuxciMOC3EtGWoyY+TCR59NTu8HA
X-Gm-Gg: AZuq6aKv7T5tsoiQRgbCKs+rYaAQ/UzjwlK+Rt/KUwiIQAhM/UXZSk38s34GaE4W3Wi
	c5NNHXKW6L+5ZDWAFycWNv9YUVFBoncnS483ulBMe4PKlhOZ36tbCErtCaN2BD7C1LcRtziUNMg
	rR0BEo56PfEt1bW/oCsKWtiLbH+Yv0grbc94FeF5LwXkwQFY1/+UiJW0AuLh+XCaHDpnQHvq0ki
	MR+e2cAm6JJxMYTwkca6aCkOcWoBmw0mKSz8NT9zm6TqTky1c9nmbXfj9rm7TspTQI80Djocp9W
	C2Lg0wvn5hJk+uSTk9X9l+ZKXp54YUXqgzibftKPSihXjQjH16TMj9PGwlH+hi9kQOM+uuIS457
	qRvauvZkMpjwCw0qnm6SvO5ZmNtMql8bH7Ik6JzajukiBjZAWnJhbEi+UVoTi00weiE3Z5rS/9j
	HDgBsmcX7KRITb2rZ+DPVD62sEKj0+KQAssj0AZs0VT7QtO260qZ7e34to4DxNBmzC4OrE
X-Received: by 2002:a05:6a00:1590:b0:7fb:cf05:93cb with SMTP id d2e1a72fcca58-82527460066mr1139313b3a.1.1771412511875;
        Wed, 18 Feb 2026 03:01:51 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2c4e5sm16582293b3a.4.2026.02.18.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 03:01:51 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH] usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
Date: Wed, 18 Feb 2026 16:01:21 +0500
Message-ID: <20260218110121.10185-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10199-lists,kernel-janitors=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 78177155C35
X-Rspamd-Action: no action

The platform_get_irq_byname_optional() function returns a non-zero
IRQ number on success and a negative error code on failure. It
never returns zero.

The current implementation checks for a return value less than or
equal to zero. Since zero is not a valid return value, simplify
the check to only look for negative error codes.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 drivers/usb/dwc3/dwc3-qcom-legacy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom-legacy.c b/drivers/usb/dwc3/dwc3-qcom-legacy.c
index d3fad0fcfdac..34c578309802 100644
--- a/drivers/usb/dwc3/dwc3-qcom-legacy.c
+++ b/drivers/usb/dwc3/dwc3-qcom-legacy.c
@@ -620,14 +620,14 @@ static int dwc3_qcom_find_num_ports(struct platform_device *pdev)
 	int irq;
 
 	irq = platform_get_irq_byname_optional(pdev, "dp_hs_phy_1");
-	if (irq <= 0)
+	if (irq < 0)
 		return 1;
 
 	for (port_num = 2; port_num <= DWC3_QCOM_MAX_PORTS; port_num++) {
 		sprintf(irq_name, "dp_hs_phy_%d", port_num);
 
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq <= 0)
+		if (irq < 0)
 			return port_num - 1;
 	}
 
-- 
2.43.0


