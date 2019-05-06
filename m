Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1894F14A3B
	for <lists+kernel-janitors@lfdr.de>; Mon,  6 May 2019 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbfEFMvT (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 6 May 2019 08:51:19 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:44722 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfEFMvT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 May 2019 08:51:19 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46CiT9Z158006;
        Mon, 6 May 2019 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=ZqgoNDVMow9tzy6yMM0RxqKAEBnofHDY9EXOg2QtaG4=;
 b=XD+I3u3AGiYylFXjBBaOZndm1bgZHoBMYi4dJgJet/w8J6qdpyxfF7tPeb/FpA0o89lE
 tS1HzWDjKWgF5lRvTh69kDq4bfKLDakF78BiwWbIhgB/WC9xK4x7YBXB4p1UBiTGWoqT
 EXoYROIIDxD6WX5KgBfn/oIc+KTpXu+CCx6FjAx6Tb7XG6WueWa30ErnDFVNy7hlRLMw
 4iVa6ETSt2RJOKSmQv3L3EjmxrARf+qEoVtWwym7xCx9WcF5lelac4kzhFlL0GG3EZm1
 Yg5txZifDv7s/+luNzjXvb+e3WeIiV14QFnEJvp3tA+gCiwua6oREj/SF7UC1RA4A234 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 2s94b5p8yt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 12:50:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x46Cno5N094544;
        Mon, 6 May 2019 12:50:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2sagytbdqu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 06 May 2019 12:50:36 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x46CoS2T001968;
        Mon, 6 May 2019 12:50:28 GMT
Received: from mwanda (/105.52.123.240)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 06 May 2019 05:50:28 -0700
Date:   Mon, 6 May 2019 15:50:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jason Wessel <jason.wessel@windriver.com>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        kgdb-bugreport@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] kdb: do a sanity check on the cpu in kdb_per_cpu()
Message-ID: <20190506125018.GA13799@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905060112
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9248 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905060112
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "whichcpu" comes from argv[3].  The cpu_online() macro looks up the
cpu in a bitmap of online cpus, but if the value is too high then it
could read beyond the end of the bitmap and possibly Oops.

Fixes: 5d5314d6795f ("kdb: core for kgdb back end (1 of 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index fc96dbf8d9de..9ecfa37c7fbf 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2583,7 +2583,7 @@ static int kdb_per_cpu(int argc, const char **argv)
 		diag = kdbgetularg(argv[3], &whichcpu);
 		if (diag)
 			return diag;
-		if (!cpu_online(whichcpu)) {
+		if (whichcpu >= nr_cpu_ids || !cpu_online(whichcpu)) {
 			kdb_printf("cpu %ld is not online\n", whichcpu);
 			return KDB_BADCPUNUM;
 		}
-- 
2.18.0

