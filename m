Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B579510E1D
	for <lists+kernel-janitors@lfdr.de>; Wed, 27 Apr 2022 03:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243864AbiD0BmG (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Apr 2022 21:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356792AbiD0BmF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Apr 2022 21:42:05 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62330FE5E4
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Apr 2022 18:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=EqlJFrirIuN6/jFpvQBt0qkjkLubUZLlF1k8KoDAy4k=; b=uhu0BxlOHFONUbyZvFxJlzeAMW
        kXw4JpR+R/pH8QNJyVrPbbge+XLRJzZAoUdN3Z2PkZHBH2XWYS1a7krBMS7pb9n+A2LNJPhI1QiNK
        hX+/NQW4/6U4rFdwMZ9epoM7TI43iMKifmrse7Db8Ru2VXKiz0XgzbpLE3H571/AdTCQjOLRXipTS
        AaG9IuxWM02eFPoZ0d4Q/lxCAXOy4tiiirhS9yRxu3h4abyfEi5Iw809hEnBC3C6uzZroiBaSWlAN
        DgLLIc6LTREGsB/sELD7dWuYWQ03KvhXI63UcSIoD0Eh9eiH01t2Z+tHPgYHboF+Wv1JGz94haSe0
        SkZGa4+A==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1njWdi-00ABKS-3m; Wed, 27 Apr 2022 01:38:46 +0000
Message-ID: <88d7b912-a12f-4bc9-abe6-e221a37f2eb2@infradead.org>
Date:   Tue, 26 Apr 2022 18:38:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] drm/amdgpu: debugfs: fix NULL dereference in
 ta_if_invoke_debugfs_write()
Content-Language: en-US
To:     Alex Deucher <alexdeucher@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Candice Li <candice.li@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
        David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        John Clements <john.clements@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>
References: <Ymexw96moFElQvqG@kili> <YmeyEF4djrguNMEF@kili>
 <CADnq5_PmoHWzJ9Mh=-ghMzOexv20h-Du2hGsoaR0owdDBnc8iw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CADnq5_PmoHWzJ9Mh=-ghMzOexv20h-Du2hGsoaR0owdDBnc8iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Alex--

On 4/26/22 07:47, Alex Deucher wrote:
> Applied the series.  Thanks!
> 
> Alex
> 

I just saw a build warning here when CONFIG_DEBUG_FS is not enabled:

../drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c:281:23: warning: 'amdgpu_ta_if_debugfs_create' defined but not used [-Wunused-function]
  281 | static struct dentry *amdgpu_ta_if_debugfs_create(struct amdgpu_device *adev)
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~


-- 
~Randy
