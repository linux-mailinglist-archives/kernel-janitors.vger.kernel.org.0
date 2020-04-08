Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB321A1E51
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 Apr 2020 11:51:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgDHJvF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 8 Apr 2020 05:51:05 -0400
Received: from smtprelay0053.hostedemail.com ([216.40.44.53]:38766 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725932AbgDHJvF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Apr 2020 05:51:05 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 942F933C4;
        Wed,  8 Apr 2020 09:51:04 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3622:3866:3868:3870:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6119:7903:9025:9040:10004:10400:11232:11658:11914:12043:12295:12296:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:13845:14181:14659:14721:21080:21212:21627:21660:21811:21939:30054:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: dad70_437cbb6622e09
X-Filterd-Recvd-Size: 1539
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf06.hostedemail.com (Postfix) with ESMTPA;
        Wed,  8 Apr 2020 09:51:03 +0000 (UTC)
Message-ID: <acc040a1c5bec74cb78e2ee7e859c6989647c343.camel@perches.com>
Subject: Re: [PATCH] gpu/drm: ingenic: Delete an error message in
 ingenic_drm_probe()
From:   Joe Perches <joe@perches.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        kernel-janitors@vger.kernel.org
Date:   Wed, 08 Apr 2020 02:49:04 -0700
In-Reply-To: <20200408094244.GM2001@kadam>
References: <e03e7106-0f22-99c4-ad21-b288e8990b5a@web.de>
         <a0a0c054-f71e-a23e-ba47-c1f6554b79e6@wanadoo.fr>
         <alpine.DEB.2.21.2004051948120.3208@hadrien>
         <9549b4a1-5874-5f00-6237-d5f5161e9852@wanadoo.fr>
         <20200408094244.GM2001@kadam>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, 2020-04-08 at 12:42 +0300, Dan Carpenter wrote:
> On Mon, Apr 06, 2020 at 07:48:52PM +0200, Christophe JAILLET wrote:
> > Nevertheless, I wrote another script (see below), which triggers ~2800 times
> > in ./drivers only.
> > Some are false positives, but most look valid.
> 
> I did a quick grep and you're right there are a ton of these!

Quite a lot of them use pr_cont too.

Anyway, try this:
https://lore.kernel.org/lkml/8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com/


