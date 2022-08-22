Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D9959BC05
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Aug 2022 10:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbiHVIvc (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Aug 2022 04:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbiHVIvb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 04:51:31 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2700A65D8;
        Mon, 22 Aug 2022 01:51:30 -0700 (PDT)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MB5bh6LM1zkWLK;
        Mon, 22 Aug 2022 16:48:00 +0800 (CST)
Received: from [10.174.177.76] (10.174.177.76) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:51:28 +0800
Subject: Re: [PATCH] mm/hugetlb: remove unused local variable dst_entry in
 copy_hugetlb_page_range()
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>
References: <20220822082525.26071-1-lukas.bulwahn@gmail.com>
From:   Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <08fec67b-788e-1c9e-606e-903db3bcad67@huawei.com>
Date:   Mon, 22 Aug 2022 16:51:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20220822082525.26071-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.76]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2022/8/22 16:25, Lukas Bulwahn wrote:
> Commit a0e4f7b82610 ("mm/hugetlb: make detecting shared pte more reliable")
> modifies copy_hugetlb_page_range() such that huge_ptep_get(dst_pte) and the
> local variable dst_entry is not used explicitly in this function.
> 
> Remove this unused local variable dst_entry in copy_hugetlb_page_range().
> No functional change.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

LGTM. Thanks for your patch.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>

BTW: I will send a v2 of that series soon. So the above commit id might change.

Thanks,
Miaohe Lin

