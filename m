Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B50D61FF68A
	for <lists+kernel-janitors@lfdr.de>; Thu, 18 Jun 2020 17:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731452AbgFRPYS (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 18 Jun 2020 11:24:18 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:52787 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726905AbgFRPYS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Jun 2020 11:24:18 -0400
X-IronPort-AV: E=Sophos;i="5.75,251,1589234400"; 
   d="scan'208";a="455442568"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2020 17:23:53 +0200
Date:   Thu, 18 Jun 2020 17:23:53 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Giacomo Picchiarelli <gpicchiarelli@gmail.com>
cc:     kernel-janitors@vger.kernel.org
Subject: Re: [help][coccinelle] coccicheck failed
In-Reply-To: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2006181722410.2367@hadrien>
References: <47cba5b5-0d49-f6e8-09db-557a4c15f285@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Thu, 18 Jun 2020, Giacomo Picchiarelli wrote:

> Newbie here. I couldn't try the patch attached.

Hi,

I'm not sure what you are trying to do.  The patch attached is a real
patch, not a Coccinelle semantic patch.

> I'm using coccinelle (spatch version 1.0.4 with Python support and with PCRE support),
> I'm having issues with the following command:
>
> make coccicheck MODE=patch
>
> "./tools/testing/selftests/net/hwtstamp_config.c:74:45-46: WARNING: Use ARRAY_SIZE
>
> 807 811
>
> coccicheck failed"

Randy's suggestion about DEBUG is good.  You can also get a more modern
version of Coccinelle from github.

julia


> Applied to: commit 1b5044021070efa3259f3e9548dc35d1eb6aa844 (HEAD -> master, origin/master, origin/HEAD)
> Merge: 69119673bd50 dbed452a078d
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Jun 17 11:29:37 2020 -0700
>
> Suggestions?
>
> --
> Giacomo Picchiarelli <gpicchiarelli@gmail.com>
> GPG Key: 2E51 2591 F3E8 7CDC F504  140F 8559 3ACF 4691 ACC0
>
>
