Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C502444F3
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 18:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392542AbfFMQkv (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 12:40:51 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:41106 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbfFMG5B (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 02:57:01 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D6sMnZ030606;
        Thu, 13 Jun 2019 06:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=Rydac0kByKvRlT58oD81CeEmII8iE4ez/kqn0T7bhHc=;
 b=BVlJnpxV5rDOyTJgv7p3PzIaCOGoglizj9apj5P1I/OeZkHktovm318MJAQjDKX4TmtS
 yhnoh4CbT7AkSPcCWcV1DpXi70uRmTNEi9eq1iBbpEAdCl+Nop8edbPXzN0eHVYSXZBZ
 37VSiMdjE74vMS2AlqTHtnWmT02DQXWzmdEyKi004CKWNOL6zEPC23KZlDyYjUzq51FL
 mDUzHzrFCna8tLYEKpsNzLvZZIBBK9LMC7ASGdf3mA9zOnUoprMc0Oi6ooimB9rBzUfb
 lu5rZaLKeeTD3MHkwpwxDxMxyFc0AJpIXonGPYdEQyn8EUjeY/LsRTZAbuHvjRDPU2RL FA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 2t02heyryp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 06:56:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5D6tLbf005474;
        Thu, 13 Jun 2019 06:56:50 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 2t024vbq0r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Jun 2019 06:56:50 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5D6ujtG012959;
        Thu, 13 Jun 2019 06:56:46 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 12 Jun 2019 23:56:45 -0700
Date:   Thu, 13 Jun 2019 09:56:37 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christoph Lameter <cl@linux.com>, Kees Cook <keescook@chromium.org>
Cc:     Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/slab: restore IRQs in kfree()
Message-ID: <20190613065637.GE16334@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906130055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9286 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906130055
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

We added a new return here but we need to restore the IRQs before
we leave.

Fixes: 4f5d94fd4ed5 ("mm/slab: sanity-check page type when looking up cache")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 mm/slab.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/slab.c b/mm/slab.c
index 9e3eee5568b6..db01e9aae31b 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3745,8 +3745,10 @@ void kfree(const void *objp)
 	local_irq_save(flags);
 	kfree_debugcheck(objp);
 	c = virt_to_cache(objp);
-	if (!c)
+	if (!c) {
+		local_irq_restore(flags);
 		return;
+	}
 	debug_check_no_locks_freed(objp, c->object_size);
 
 	debug_check_no_obj_freed(objp, c->object_size);
-- 
2.20.1

