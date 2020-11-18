Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902F22B79D5
	for <lists+kernel-janitors@lfdr.de>; Wed, 18 Nov 2020 10:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbgKRJAF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 18 Nov 2020 04:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726020AbgKRJAF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Nov 2020 04:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605690003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vDHRiKISJxGrQNI5r+p1qOzE9Z04EU79HQXJnXOQAyM=;
        b=epeFmXuG0tCYLP/m5ZSJlTUwZY/OUmPuk0HnZf3cC/iniYClXPfzqfzmRGrunc4VbqpBTi
        je6a7BZohCqrnSOK07kOHcaAdcq1OW3dFbOf43NZH6e7wNLbpqQwgamG/6Iubuuu3Xvl2/
        TNhd6CKN89NKkMCTXxgtWnlnb1TD0xo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-OAkGKknzMTGTaDgt5wmcpQ-1; Wed, 18 Nov 2020 04:00:02 -0500
X-MC-Unique: OAkGKknzMTGTaDgt5wmcpQ-1
Received: by mail-wr1-f71.google.com with SMTP id y2so657997wrl.3
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Nov 2020 01:00:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vDHRiKISJxGrQNI5r+p1qOzE9Z04EU79HQXJnXOQAyM=;
        b=J1JtW8c9Cl3eWmV98zF16WpbMzYntfo0Nltu5PoNz7w5Z+3iqcFpkMjJ3zXmXphIcQ
         iQ6mbqenlHX8L0kosuZvjnCaycF5TVDs2aqssJdugK7S5urHN/rSdlXcKjallA39EOFX
         RJyAIC2vJvlunhwfcQuufnnT2hbaSZS95zSMePeaxfdJCaLhCKGlGxzHp084gK5uiJXf
         SkXNrVW25MRvkG8NTrVU94exf1ulJMaRzIZDE5DZgaSCcCyT7pfEXH4bFoFbqpPhzI42
         f9mnm9q9bW594q5TospNFwkOjNmIrl/Xz6tdpMPWduDZdnqcH032nn6GNLKuVDO4tK/l
         HzhQ==
X-Gm-Message-State: AOAM5333guIYeBitsNKoR4qy8BbK/Dm1+ZOW9lyN64R1xdtdnoQEIz/9
        Vk1iImkjYqS898luAU+b/xBGi1/TuyoSNFLt7A2tJL8xGZeaUrHdbvjj9T10zhEd59rrtcWyH/T
        hZYGAgIjE322uEOILuUNGyAR8NLKy
X-Received: by 2002:adf:e484:: with SMTP id i4mr3807474wrm.398.1605690000243;
        Wed, 18 Nov 2020 01:00:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvrhlBebUzDcS1q8vIsRe9j3CAHx2KE5uTkubSY1aExSKkOG/BenM/FdfTnVGvEnynvcKDSg==
X-Received: by 2002:adf:e484:: with SMTP id i4mr3807461wrm.398.1605690000074;
        Wed, 18 Nov 2020 01:00:00 -0800 (PST)
Received: from redhat.com (bzq-109-67-54-78.red.bezeqint.net. [109.67.54.78])
        by smtp.gmail.com with ESMTPSA id i11sm33187631wro.85.2020.11.18.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 00:59:59 -0800 (PST)
Date:   Wed, 18 Nov 2020 03:59:55 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kvm@vger.kernel.org,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, kuba@kernel.org
Subject: Re: [PATCH net] vhost_vdpa: Return -EFUALT if copy_from_user() fails
Message-ID: <20201118035912-mutt-send-email-mst@kernel.org>
References: <20201023120853.GI282278@mwanda>
 <20201023113326-mutt-send-email-mst@kernel.org>
 <4485cc8d-ac69-c725-8493-eda120e29c41@redhat.com>
 <e7242333-b364-c2d8-53f5-1f688fc4d0b5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7242333-b364-c2d8-53f5-1f688fc4d0b5@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Nov 18, 2020 at 02:08:17PM +0800, Jason Wang wrote:
> 
> On 2020/10/26 上午10:59, Jason Wang wrote:
> > 
> > On 2020/10/23 下午11:34, Michael S. Tsirkin wrote:
> > > On Fri, Oct 23, 2020 at 03:08:53PM +0300, Dan Carpenter wrote:
> > > > The copy_to/from_user() functions return the number of bytes which we
> > > > weren't able to copy but the ioctl should return -EFAULT if they fail.
> > > > 
> > > > Fixes: a127c5bbb6a8 ("vhost-vdpa: fix backend feature ioctls")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > > Needed for stable I guess.
> > 
> > 
> > Agree.
> > 
> > Acked-by: Jason Wang <jasowang@redhat.com>
> 
> 
> Hi Michael.
> 
> I don't see this in your tree, please consider to merge.
> 
> Thanks
> 

I do see it there:

commit 7922460e33c81f41e0d2421417228b32e6fdbe94
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Oct 23 15:08:53 2020 +0300

    vhost_vdpa: Return -EFAULT if copy_from_user() fails
    
the reason you can't find it is probably because I fixed up
a typo in the subject.


-- 
MST

