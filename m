Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694014E414F
	for <lists+kernel-janitors@lfdr.de>; Tue, 22 Mar 2022 15:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234750AbiCVOa5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 22 Mar 2022 10:30:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbiCVOa5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Mar 2022 10:30:57 -0400
Received: from ha.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E4C9654A1;
        Tue, 22 Mar 2022 07:29:29 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by ha.nfschina.com (Postfix) with ESMTP id 345A31E80D6B;
        Tue, 22 Mar 2022 22:28:40 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from ha.nfschina.com ([127.0.0.1])
        by localhost (ha.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9lyuXtfIkRuj; Tue, 22 Mar 2022 22:28:37 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: liqiong@nfschina.com)
        by ha.nfschina.com (Postfix) with ESMTPA id 3586C1E80D24;
        Tue, 22 Mar 2022 22:28:37 +0800 (CST)
From:   liqiong <liqiong@nfschina.com>
To:     naoya.horiguchi@nec.com, akpm@linux-foundation.org
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, yuzhe@nfschina.com,
        renyu@nfschina.com, liqiong <liqiong@nfschina.com>
Subject: [PATCH] mm: remove unnecessary (void*) conversions.
Date:   Tue, 22 Mar 2022 22:28:26 +0800
Message-Id: <20220322142826.25939-1-liqiong@nfschina.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220322121338.27428-1-liqiong@nfschina.com>
References: <20220322121338.27428-1-liqiong@nfschina.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

No need cast (void*) to (struct hwp_walk*).

Signed-off-by: liqiong <liqiong@nfschina.com>
Acked-by: Naoya Horiguchi <naoya.horiguchi@nec.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memory-failure.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 97a9ed8f87a9..4ed0dcf03659 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -630,7 +630,7 @@ static int check_hwpoisoned_pmd_entry(pmd_t *pmdp, unsigned long addr,
 static int hwpoison_pte_range(pmd_t *pmdp, unsigned long addr,
 			      unsigned long end, struct mm_walk *walk)
 {
-	struct hwp_walk *hwp = (struct hwp_walk *)walk->private;
+	struct hwp_walk *hwp = walk->private;
 	int ret = 0;
 	pte_t *ptep, *mapped_pte;
 	spinlock_t *ptl;
@@ -664,7 +664,7 @@ static int hwpoison_hugetlb_range(pte_t *ptep, unsigned long hmask,
 			    unsigned long addr, unsigned long end,
 			    struct mm_walk *walk)
 {
-	struct hwp_walk *hwp = (struct hwp_walk *)walk->private;
+	struct hwp_walk *hwp = walk->private;
 	pte_t pte = huge_ptep_get(ptep);
 	struct hstate *h = hstate_vma(walk->vma);
 
-- 
2.11.0

