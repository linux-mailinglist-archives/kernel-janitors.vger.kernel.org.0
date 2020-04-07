Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 877271A18A1
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Apr 2020 01:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDGXgK (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 7 Apr 2020 19:36:10 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:48439 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726393AbgDGXgK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Apr 2020 19:36:10 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id BB7B547D;
        Tue,  7 Apr 2020 19:36:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Tue, 07 Apr 2020 19:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=Yxq9f81Pb+4HSFnXBgl2WjEh9AK9LTu
        4Gf81A8IMWxE=; b=TIXwFNVFlZ3kL8pi50r2le0uO1YETHcXlswy1QwmNs24YpF
        KQbtsW9+9epxZE66IpwEzt8ZwNSgBhss3bgalYPCoTeYKCvpWZqtul6HmErU7Nt7
        IepBdc9biMzrJGoqSWTf1GHCw62F0Bh5B+Yw8D65AqRXRuoXiz2g+IOPUCt5ndhn
        iujtCCStG1J/u8+awB6YT6Eo1gf1zGWPh4NRyVrmXiuo7Jjr1pGZNzqwsm0q3stB
        SbouZRckibk1QW5GXPV2G6ViDQBr7oyuS5yBQOJuS1HW66l5f4csg1NSaqAoQG23
        nf6CM9pH0qi5YI9xzZZ4FFXJ9524bjy6nEJt9iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Yxq9f8
        1Pb+4HSFnXBgl2WjEh9AK9LTu4Gf81A8IMWxE=; b=t2FjNQ3G3K38P8X2V7r5bk
        L8dXUojXrOqYdgVXVTGF8VG9lgmnoGV32LyrYloMQdKDnSMA230V0WGKDIurJRVT
        vJ4v5ycqlnSbrD5SXw5Ksmx53YowPer0MN1VT6oELDfaD2tMWYwY/xAOlGuklE+E
        clKW6ZMjNUlD/7jUqOsfyvVdP3/zsLUfF822WsXrPiN8S2/O+qUmjaQnnG/dXEfT
        xp6kRgBa2W8fKJMOClbvSOuqC+4ddUsSoaLT+UkeMxk8eno4KXZtTOhTsfOG2g6f
        tRKaKxX6SIrdwCqACIheRCHUS0bfu3WDWoDxgYUJxfiX+rP1wK0wJCcllWWvhkPA
        ==
X-ME-Sender: <xms:Zw6NXjQ_JQQP_tJnx9C8OVWapompPjtTeGZsSH2NCeae8Mv3xAr_xg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeigddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
    rdhiugdrrghu
X-ME-Proxy: <xmx:Zw6NXuYk4BJ1FabOniAJ6oCocEs42n88oz8jpuUHWlH9zkNGxH82lg>
    <xmx:Zw6NXsTBAw9OOPuX9OtdNCDkoAtostsKtRpBGoWaE5xFpm35MK-jug>
    <xmx:Zw6NXp54Z8u8PUbRBJxG1exOmQxk5xuSQv1o6GOWtfz8oXOFuHftww>
    <xmx:aA6NXkxW94IAS2ehtk18Jsg0X0kWmccoBEpnsM0Jf9NG1rYvcNkUng>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F38B6E00A6; Tue,  7 Apr 2020 19:36:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1084-gdc5e709-fmstable-20200406v2
Mime-Version: 1.0
Message-Id: <0744752b-a48e-4edf-ba77-df605fd242a9@www.fastmail.com>
In-Reply-To: <CACPK8XfA-4WvgVeEKi-hdC-LgEcicEhpV_0ivwymaEJKy15hGA@mail.gmail.com>
References: <20200407122149.GA100026@mwanda>
 <CACPK8XfA-4WvgVeEKi-hdC-LgEcicEhpV_0ivwymaEJKy15hGA@mail.gmail.com>
Date:   Wed, 08 Apr 2020 09:06:25 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>,
        "Dan Carpenter" <dan.carpenter@oracle.com>
Cc:     "Corey Minyard" <minyard@acm.org>, "Arnd Bergmann" <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Haiyue Wang" <haiyue.wang@linux.intel.com>,
        openipmi-developer@lists.sourceforge.net,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ipmi: kcs: Fix aspeed_kcs_probe_of_v1()
Content-Type: text/plain
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Wed, 8 Apr 2020, at 08:48, Joel Stanley wrote:
> On Tue, 7 Apr 2020 at 12:22, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > This needs to return the newly allocated struct but instead it returns
> > zero which leads to an immediate Oops in the caller.
> >
> > Fixes: 09f5f680707e ("ipmi: kcs: aspeed: Implement v2 bindings")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks for the fix Dan.
> 
> Andrew, I think this means no one has used the v1 bindings in
> mainline, so could remove that code?

No, rather Dan's on the ball and it seems I was a bit lax with my testing
of the patch. I pinged Corey only the other day regarding the patches;
he had been busy and as such hadn't merged them.

I have a series to convert our devicetrees over to v2. Now that Corey's
taken the patches I can send that and we can get away from v1.

Thanks for the fix Dan.

Acked-by: Andrew Jeffery <andrew@aj.id.au>
