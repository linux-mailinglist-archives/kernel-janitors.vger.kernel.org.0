Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8ED28A27D
	for <lists+kernel-janitors@lfdr.de>; Sun, 11 Oct 2020 00:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390478AbgJJW5Y (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 10 Oct 2020 18:57:24 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:47810 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733296AbgJJUIz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 10 Oct 2020 16:08:55 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09AK4YJC124759;
        Sat, 10 Oct 2020 20:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=l4MehOBSki1MlyoBVVMqnZ9yjHjhqpcliYksNNP4rJM=;
 b=fUmnMPNv5v4eHs1Gb0toQEZekMN1C5izjAf3hi0I95wOoW+hQPxZA4IA8RAG4a5eE+rC
 VUh037RbpUWEMhkrK/eiTaADhARKt9xQv/exNfhqSncqJ5ANmNDeXgB/of5XSaPki5qY
 7Gp1aE6t2R4mOxn0M2EWewCOkouilkWv8k4tROItY1j0pQgb4aQ7AHsQ5MBbVbBR+A51
 TV5ki/27TwlDVfxa1C8ynrb/oAtdgHFhUX+aL1bW1Zc92pWjmVi8pN6ucL5P1Jss/mtL
 8Ej2FLCJu9FW48y08VFzeblF23kKxNwIZolMRjukQ2++ONW/VohbeZyp75124IKH3/Si FQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 3435km961b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 10 Oct 2020 20:08:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09AK5TMX066381;
        Sat, 10 Oct 2020 20:08:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 343309srd3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 10 Oct 2020 20:08:25 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09AK8Kia029518;
        Sat, 10 Oct 2020 20:08:20 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 10 Oct 2020 13:08:19 -0700
Date:   Sat, 10 Oct 2020 23:08:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] mm/hmm/test: Fix an error code in dmirror_allocate_chunk()
Message-ID: <20201010200812.GA1886610@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9770 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=2 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010100189
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9770 signatures=668681
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=2 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010100189
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is supposed to return false on failure, not a negative error code.

Fixes: 170e38548b81 ("mm/hmm/test: use after free in dmirror_allocate_chunk()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I messed this up earlier...  My devel version of Smatch prints too much
garbage so I missed the warning when I first wrote the patch.  :/
Sorry.

 lib/test_hmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e151a7f10519..80a78877bd93 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -461,7 +461,7 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 
 	devmem = kzalloc(sizeof(*devmem), GFP_KERNEL);
 	if (!devmem)
-		return -ENOMEM;
+		return false;
 
 	res = request_free_mem_region(&iomem_resource, DEVMEM_CHUNK_SIZE,
 				      "hmm_dmirror");
-- 
2.28.0

