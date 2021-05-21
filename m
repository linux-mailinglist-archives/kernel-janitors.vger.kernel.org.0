Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AFA38BB68
	for <lists+kernel-janitors@lfdr.de>; Fri, 21 May 2021 03:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236511AbhEUBQY (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 20 May 2021 21:16:24 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3635 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236106AbhEUBQX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 21:16:23 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmT9k1rJDzmWpV;
        Fri, 21 May 2021 09:12:42 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 09:14:59 +0800
Received: from [10.136.110.154] (10.136.110.154) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 09:14:58 +0800
Subject: Re: [PATCH -next] erofs: fix error return code in
 erofs_read_superblock()
To:     Gao Xiang <xiang@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>, <linux-erofs@lists.ozlabs.org>
References: <20210519141657.3062715-1-weiyongjun1@huawei.com>
 <20210520053226.GB1955@kadam>
 <20210520084023.GA5720@hsiangkao-HP-ZHAN-66-Pro-G1>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <9f96b12f-b05b-c118-4391-448f780702ff@huawei.com>
Date:   Fri, 21 May 2021 09:14:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210520084023.GA5720@hsiangkao-HP-ZHAN-66-Pro-G1>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.110.154]
X-ClientProxiedBy: dggemx704-chm.china.huawei.com (10.1.199.51) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2021/5/20 16:40, Gao Xiang wrote:
> Hi Yongjun and Dan,
> 
> On Thu, May 20, 2021 at 08:32:26AM +0300, Dan Carpenter wrote:
>> On Wed, May 19, 2021 at 02:16:57PM +0000, Wei Yongjun wrote:
>>> 'ret' will be overwritten to 0 if erofs_sb_has_sb_chksum() return true,
>>> thus 0 will return in some error handling cases. Fix to return negative
>>> error code -EINVAL instead of 0.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>>
>> You need to add Fixes tags to bug fix patches and you need to ensure
>> that the authors of the Fixes commit are CC'd so they can review your
>> fix.  get_maintainer.pl will add the author automatically, but normally
>> I like to put them in the To header to make sure they see it.
>>
>> Fixes: b858a4844cfb ("erofs: support superblock checksum")
> 
> The commit and the tag look good to me (sorry for a bit delay on this),
> 
> Fixes: b858a4844cfb ("erofs: support superblock checksum")
> Cc: stable <stable@vger.kernel.org> # 5.5+
> Reviewed-by: Gao Xiang <xiang@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> 
> (will apply to dev-test for a while and then to -next.)
> 
> Thanks,
> Gao Xiang
> 
> .
> 
