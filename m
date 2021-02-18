Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6270731F0C5
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Feb 2021 21:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232313AbhBRUGF (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Feb 2021 15:06:05 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:18906 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231243AbhBRUEB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Feb 2021 15:04:01 -0500
X-IronPort-AV: E=Sophos;i="5.81,187,1610406000"; 
   d="scan'208";a="493774975"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 21:03:17 +0100
Date:   Thu, 18 Feb 2021 21:03:16 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Denis Efremov <efremov@linux.com>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] coccinelle: misc: add swap script
In-Reply-To: <50eb8319-a552-c749-6143-7e24a8778a04@web.de>
Message-ID: <alpine.DEB.2.22.394.2102182102500.2748@hadrien>
References: <alpine.DEB.2.22.394.2102181114380.2748@hadrien> <50eb8319-a552-c749-6143-7e24a8778a04@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Thu, 18 Feb 2021, Markus Elfring wrote:

> > A disjunction basically says "at this node in the cfg, can I match the
> > first patter, or can I match the second pattern, etc."  Unfortunately in
> > this case the two branches start matching at different nodes, so the short
> > circuit aspect of a disjunction isn't used, and it matches both patterns.
> >
> > The solution is to just make two rules.  The first for the if case and the
> > second for everything else.
>
> Will such feedback trigger further software development considerations?

No.  This is never going to change, until someone completely redesigns
Coccinelle.

julia
