Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11A993B01B2
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Jun 2021 12:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFVKti (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Jun 2021 06:49:38 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:40816 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229906AbhFVKtg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 06:49:36 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MAfNPF017546;
        Tue, 22 Jun 2021 10:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=f8huHaZTpLMAalFv4I1AeFm0cqDh6VrS9X/Atw2UPRg=;
 b=uwKsQCk3J+Dg5ZJSm0m9UxBhPbQI89NwFa6N2+8SoYP7XkaFIXI54tTkE/dUqTXCt4Hw
 aXEeasA4+JgMibSBhtgrgLpPMYto+32HbRsFBybRse7/v173mbNGH42zEjDTek0qbNPM
 533QBi/R6SQqsGR06TuOJISnAEfq3LULl3uZ4SFSlvatpVvq9oKL0/bfFB2tavRtPcdv
 D2K13tmu95T2p+D2xp5lxmGZC1wDE2+1PCUvwrY3S84Ad+8ah7Y7GTYbC9o49lCH7aWY
 LSoUJ/adTv7riVKsKTSkW+znV2mqRKVZDlPBlu/O1utoiOyotYcf1UnFB0qP2fjHdnq8 jw== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39aqqvtt2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 10:47:09 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15MAl8HJ159616;
        Tue, 22 Jun 2021 10:47:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3020.oracle.com with ESMTP id 3998d76eb8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 10:47:08 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15MAl792159585;
        Tue, 22 Jun 2021 10:47:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3998d76eax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 22 Jun 2021 10:47:07 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15MAl5uC008145;
        Tue, 22 Jun 2021 10:47:05 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 22 Jun 2021 03:47:05 -0700
Date:   Tue, 22 Jun 2021 13:46:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Arend van Spriel <aspriel@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-hsien Lin <chi-hsien.lin@infineon.com>,
        Wright Feng <wright.feng@infineon.com>,
        Chung-hsien Hsu <chung-hsien.hsu@infineon.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Hans deGoede <hdegoede@redhat.com>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, kernel-janitors@vger.kernel.org
Subject: [PATCH v3] brcmfmac: fix "board_type" in brcmf_of_probe()
Message-ID: <YNCHELb14+eNV94n@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: 8Iw1l4_AYUYqp5z3BgjR4g1U-PsQs7if
X-Proofpoint-GUID: 8Iw1l4_AYUYqp5z3BgjR4g1U-PsQs7if
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There are two bugs here:
1) devm_kzalloc() needs to be checked for allocation errors.
2) The loop was intended to be:

 Bad:	for (i = 0; i < board_type[i]; i++) {
Good:	for (i = 0; i < len; i++) {

Neither of these bugs are likely to cause an issue in practice but
they're worth fixing.  Also the code could be made simpler by using the
devm_kstrdup() and strreplace() functions.

Fixes: 29e354ebeeec ("brcmfmac: Transform compatible string for FW loading")
Suggested-by: Johannes Berg <johannes@sipsolutions.net>
Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reported-by: Hans deGoede <hdegoede@redhat.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Basically a completely different patch.  :)
v3: Add missing of_node_put() caught by Hans de Goede

 .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index a7554265f95f..dee3d968e49b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -24,20 +24,18 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 	/* Set board-type to the first string of the machine compatible prop */
 	root = of_find_node_by_path("/");
 	if (root) {
-		int i, len;
 		char *board_type;
 		const char *tmp;
 
 		of_property_read_string_index(root, "compatible", 0, &tmp);
 
 		/* get rid of '/' in the compatible string to be able to find the FW */
-		len = strlen(tmp) + 1;
-		board_type = devm_kzalloc(dev, len, GFP_KERNEL);
-		strscpy(board_type, tmp, len);
-		for (i = 0; i < board_type[i]; i++) {
-			if (board_type[i] == '/')
-				board_type[i] = '-';
+		board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
+		if (!board_type) {
+			of_node_put(root);
+			return;
 		}
+		strreplace(board_type, '/', '-');
 		settings->board_type = board_type;
 
 		of_node_put(root);
-- 
2.30.2

