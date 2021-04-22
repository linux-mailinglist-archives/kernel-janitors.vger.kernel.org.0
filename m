Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5705A36804F
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Apr 2021 14:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236222AbhDVMY5 (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 22 Apr 2021 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235791AbhDVMY4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 22 Apr 2021 08:24:56 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FA9C06174A
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Apr 2021 05:24:21 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id q4so5228814qtn.5
        for <kernel-janitors@vger.kernel.org>; Thu, 22 Apr 2021 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Is05JWHPFApn3MhnEp8CclJVYRn/uQGbj5/LETOny2Q=;
        b=Y79UHIET3J/zpQ2D5u2CwJJkSSTTFGgD+kF1m+N8tqyw/+vNAQVJb3RB33hxOnqg6G
         GobKirIX/Q3vme0FeNf+H6GW1JVkSwVMZKuwy0rvRWQlMRpgtvzJkMsXc+6N3gAb8BWV
         JukzkxcQhd2qk08R8Pkun1hEaZjZAzG73ztzwQbxHPdDVX1wOiO3sE497guh1hiR57hm
         igtSfv/t/soNU2qs7wK6pPtJRmsCFlfyC0aMyhsvdhoRqBQrP9fed2dAqOGPJtqcaqKT
         njCH624+YLnJ3D6Z1XkEP5HoLBvK7TApYgkREivoia2MpOgC4FDLz2+J9knUMqPsXgL4
         XI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Is05JWHPFApn3MhnEp8CclJVYRn/uQGbj5/LETOny2Q=;
        b=U/yVp0ifrU+GFbLu/kFyq2f8e/SBZTkMlknUfhqczTpyoCbtyArdbOlEec8O/W9qJy
         GkVuG0n5Xjn3FCFPmrfVuYcgbOGTAAk9H1qMWi/NzffS0E5EMVyqJWTCeMzPga9+2psC
         wPDhfGiimyABm0Pp+EqBTgQ5EL0wu6NkHOTb/Jo3PJgutHKXYsc4J0fruFrd78hYB23k
         pDFAookyGcD6Alp+NOqD3Te+LPXRi/Phl3D1kqRMxeUbpfdn+twH6u25NgoqvwQuJBmi
         418tS1uXTqEpm/SjKGwkEmjIypbcGeNO9NMSIiCigUf/WkGRA2EOS3L4K5/44FImbh4E
         KaGw==
X-Gm-Message-State: AOAM531fbGuS+Z8jSwJkrGlVvb5fYc66tVE6HI3kvuq8UTsr2j4iinv0
        bAjvmQgic4MpquCZFzpHz8OPYQ==
X-Google-Smtp-Source: ABdhPJxmga5jzjCzVECn9/ABhWfehVmaeDjMx6i1nagE65VyQf4VR4HrdTJmWnLH/kTlplPQEALSZQ==
X-Received: by 2002:a05:622a:1186:: with SMTP id m6mr2804440qtk.319.1619094261080;
        Thu, 22 Apr 2021 05:24:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.113.94])
        by smtp.gmail.com with ESMTPSA id e12sm2014445qtj.81.2021.04.22.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 05:24:20 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lZYNX-009xCE-Mz; Thu, 22 Apr 2021 09:24:19 -0300
Date:   Thu, 22 Apr 2021 09:24:19 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Marion et Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        tj@kernel.org, jiangshanlai@gmail.com, saeedm@nvidia.com,
        leon@kernel.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] workqueue: Have 'alloc_workqueue()' like macros
 accept a format specifier
Message-ID: <20210422122419.GF2047089@ziepe.ca>
References: <cover.1618780558.git.christophe.jaillet@wanadoo.fr>
 <ae88f6c2c613d17bc1a56692cfa4f960dbc723d2.1618780558.git.christophe.jaillet@wanadoo.fr>
 <042f5fff-5faf-f3c5-0819-b8c8d766ede6@acm.org>
 <1032428026.331.1618814178946.JavaMail.www@wwinf2229>
 <40c21bfe-e304-230d-b319-b98063347b8b@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40c21bfe-e304-230d-b319-b98063347b8b@acm.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 19, 2021 at 01:02:34PM -0700, Bart Van Assche wrote:
> On 4/18/21 11:36 PM, Marion et Christophe JAILLET wrote:
> > The list in To: is the one given by get_maintainer.pl. Usualy, I only
> > put the ML in Cc: I've run the script on the 2 patches of the serie
> > and merged the 2 lists. Everyone is in the To: of the cover letter
> > and of the 2 patches.
> > 
> > If Théo is "Tejun Heo" (  (maintainer:WORKQUEUE) ), he is already in
> > the To: line.
> Linus wants to see a "Cc: ${maintainer}" tag in patches that he receives
> from a maintainer and that modify another subsystem than the subsystem
> maintained by that maintainer.

Really? Do you remember a lore link for this?

Generally I've been junking the CC lines (vs Andrew at the other
extreme that often has 10's of CC lines)

Jason
