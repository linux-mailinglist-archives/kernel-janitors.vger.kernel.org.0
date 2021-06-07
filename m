Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9AE39E655
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Jun 2021 20:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhFGSUJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Jun 2021 14:20:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53858 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230212AbhFGSUH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 14:20:07 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 157ICVlC023994;
        Mon, 7 Jun 2021 18:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=bZkOoknjmX8oDEJfH2bL8BDO2X8dchwu0SSRQvdxjfY=;
 b=eh1Pt4rDxANw0QXj0ZKib7lvTXEWaqAnn3scbJkGBXX+VvhqDIIwo+8Pd64FYuVGPGQm
 M9cgRTOD50EyWjGHGacHR0u/0XB0WM7gyU+IBPiqkOqlvM7hIVEKGtGHEqtE12p1i7ug
 8kiMtrUdCSbDPyMIqpCZe6x8QxeFKaGwiQRmFhfTugHmBcDtgBPb12ZLlZibh2RqRbE3
 2v3a8XT+epbLE/1/Gj9xzkEb/56XfeiiwveRvVHCcCOdo8i1QhABV+6shYZL4DxVJrG3
 fZmSfOUpKq32i9hy2pq+XKzdOm1AFZucg2SQo8nkSqQFXahdyliwH1LH+TtyM7Qdwns+ Pg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 391fyr0692-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:54 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 157IDFiH112383;
        Mon, 7 Jun 2021 18:17:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38yyaa9uhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:53 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 157IHr7T123860;
        Mon, 7 Jun 2021 18:17:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 38yyaa9uhc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Jun 2021 18:17:53 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 157IHpLW006050;
        Mon, 7 Jun 2021 18:17:51 GMT
Received: from mwanda (/41.212.42.34)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 07 Jun 2021 11:17:50 -0700
Date:   Mon, 7 Jun 2021 21:17:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Larry Finger <Larry.Finger@lwfinger.net>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Kaiser <martin@kaiser.cx>,
        Ivan Safonov <insafonov@gmail.com>,
        Deborah Brouwer <deborahbrouwer3563@gmail.com>,
        Simon Fong <simon.fodin@gmail.com>,
        Michael Straube <straube.linux@gmail.com>,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH 3/7] staging: rtl8188eu: use safe iterator in
 dequeue_xmitframes_to_sleeping_queue()
Message-ID: <YL5ixzKaYKkpHhky@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YL5iX3Exc0HVYrsi@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: DZMpyLvdr9tFbz0t8jOu5cBlVP-HTSVe
X-Proofpoint-GUID: DZMpyLvdr9tFbz0t8jOu5cBlVP-HTSVe
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On some code paths the xmitframe_enqueue_for_sleeping_sta() function can
call list_del_init(&pxmitframe->list) which would lead to a forever loop
because "pxmitframe" is the list iterator.  Use the _safe version of the
iterator to prevent this.

Fixes: 23017c8842d2 ("staging: rtl8188eu: Use list iterators and helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/rtl8188eu/core/rtw_xmit.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_xmit.c b/drivers/staging/rtl8188eu/core/rtw_xmit.c
index dcc29a74612d..f57e41f817ca 100644
--- a/drivers/staging/rtl8188eu/core/rtw_xmit.c
+++ b/drivers/staging/rtl8188eu/core/rtw_xmit.c
@@ -1729,17 +1729,15 @@ int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_fra
 
 static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
 {
-	struct list_head *plist, *phead;
+	struct list_head *phead;
 	u8	ac_index;
 	struct tx_servq	*ptxservq;
 	struct pkt_attrib	*pattrib;
-	struct xmit_frame	*pxmitframe;
+	struct xmit_frame	*pxmitframe, *n;
 	struct hw_xmit *phwxmits =  padapter->xmitpriv.hwxmits;
 
 	phead = get_list_head(pframequeue);
-	list_for_each(plist, phead) {
-		pxmitframe = list_entry(plist, struct xmit_frame, list);
-
+	list_for_each_entry_safe(pxmitframe, n, phead, list) {
 		xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		pattrib = &pxmitframe->attrib;
-- 
2.30.2

