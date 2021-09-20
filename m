Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 518EC41195D
	for <lists+kernel-janitors@lfdr.de>; Mon, 20 Sep 2021 18:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242840AbhITQQE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Sep 2021 12:16:04 -0400
Received: from relaydlg-01.paragon-software.com ([81.5.88.159]:59239 "EHLO
        relaydlg-01.paragon-software.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242762AbhITQOZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Sep 2021 12:14:25 -0400
Received: from dlg2.mail.paragon-software.com (vdlg-exch-02.paragon-software.com [172.30.1.105])
        by relaydlg-01.paragon-software.com (Postfix) with ESMTPS id 4AF94821F6;
        Mon, 20 Sep 2021 19:12:57 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paragon-software.com; s=mail; t=1632154377;
        bh=wuDdTyPetTEzRQ4y4eTAWgHy8+xrc7SOdwkMIA0RNpc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=KkfmucBWdo47N89nCE+N2ZIQxvFYljf3UyWsP00tn5R0ZkpJlTHXxn764UBtfm5J2
         XkPkukSzsgQEquKzAgerIswmFGs+4lstadNtgkYK1ZmjdfeCITjP7ejhHggPRhcrG4
         tB+t2RzKsHfaV2rG0LgOu0xZ5g8HFWcXpa/P6hY8=
Received: from [192.168.211.150] (192.168.211.150) by
 vdlg-exch-02.paragon-software.com (172.30.1.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 20 Sep 2021 19:12:56 +0300
Message-ID: <2692afd4-f263-838a-a80e-e6f740d44f36@paragon-software.com>
Date:   Mon, 20 Sep 2021 19:12:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH][next] fs/ntfs3: Fix a memory leak on object opts
Content-Language: en-US
To:     Kari Argillander <kari.argillander@gmail.com>,
        Colin King <colin.king@canonical.com>
CC:     <ntfs3@lists.linux.dev>, <kernel-janitors@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20210910100202.29254-1-colin.king@canonical.com>
 <20210910105018.asvmzihjdqeqm25v@kari-VirtualBox>
From:   Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
In-Reply-To: <20210910105018.asvmzihjdqeqm25v@kari-VirtualBox>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.211.150]
X-ClientProxiedBy: vobn-exch-01.paragon-software.com (172.30.72.13) To
 vdlg-exch-02.paragon-software.com (172.30.1.105)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 10.09.2021 13:50, Kari Argillander wrote:
> On Fri, Sep 10, 2021 at 11:02:02AM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently a failed allocation on sbi->upcase will cause an exit via
>> the label free_sbi causing a memory leak on object opts. Fix this by
>> re-ordering the exit paths free_opts and free_sbi so that kfree's occur
>> in the reverse allocation order.
>>
>> Addresses-Coverity: ("Resource leak")
>> Fixes: 27fac77707a1 ("fs/ntfs3: Init spi more in init_fs_context than fill_super")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
> 
> Thanks Colin.
> 
> Reviewed-by: Kari Argillander <kari.argillander@gmail.com>
> 
>>  fs/ntfs3/super.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
>> index 3cba0b5e7ac7..69f23db0d727 100644
>> --- a/fs/ntfs3/super.c
>> +++ b/fs/ntfs3/super.c
>> @@ -1450,10 +1450,10 @@ static int ntfs_init_fs_context(struct fs_context *fc)
>>  	fc->ops = &ntfs_context_ops;
>>  
>>  	return 0;
>> -free_opts:
>> -	kfree(opts);
>>  free_sbi:
>>  	kfree(sbi);
>> +free_opts:
>> +	kfree(opts);
>>  	return -ENOMEM;
>>  }
>>  
>> -- 
>> 2.32.0
>>

Hi, Colin, Kari!

Thanks for work - applied!
