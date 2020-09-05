Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60E825E7A1
	for <lists+kernel-janitors@lfdr.de>; Sat,  5 Sep 2020 14:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgIEMxF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 5 Sep 2020 08:53:05 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:47188 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIEMxC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 5 Sep 2020 08:53:02 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 085Cocew046747;
        Sat, 5 Sep 2020 12:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=uSqPtJevi6pe0Oip3Y0cuNVrjyGGllav5O2awGGUaJE=;
 b=IsXecoH2Wq2aKQXws3voxTRpMAJaT8gI05Kv6OmBV5APcSEoFFpdLfU4hI2428MG9xOG
 MfKY4yMOJSfkjqM0XOz7GwVGuMjFn10RlIjC8wZTtBufXsjAxlHOmIo+XmMBy0H4GW+V
 EBkNkDCOh4BAF1SDHSF99QsN+RYG33a7T7zQd3nifRAhk0LBvn385DLm9Gl42BxTWFmg
 EN9K2LqmItgAfr+ZiOz7zvFYCtyqR+JF/e27Qh9FjBCP31wFE3WFR/30HxzR4WFA1C3h
 /4PyLQjKOwjLS9hc+UOLtnug6HWg89704mAcLGaFGQuF4rU7Gb5xE1eUemQhdurD/pek EQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 33c23qh7bd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 05 Sep 2020 12:52:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 085CjNRl167809;
        Sat, 5 Sep 2020 12:50:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 33c0q91a7p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Sep 2020 12:50:31 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 085CoUun001249;
        Sat, 5 Sep 2020 12:50:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 05 Sep 2020 05:50:29 -0700
Date:   Sat, 5 Sep 2020 15:50:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Ingo Molnar <mingo@redhat.com>, kernel-janitors@vger.kernel.org
Subject: [PATCH] tracing: remove a pointless assignment
Message-ID: <20200905125020.GD183976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=2
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009050122
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9734 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=2 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009050123
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "tr" is a stack variable so setting it to NULL before a return is
a no-op.  Delete the assignment.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/trace/trace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index f40d850ebabc..a19b56f24350 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8799,7 +8799,6 @@ static int __remove_instance(struct trace_array *tr)
 	free_cpumask_var(tr->tracing_cpumask);
 	kfree(tr->name);
 	kfree(tr);
-	tr = NULL;
 
 	return 0;
 }
-- 
2.28.0

