Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C27708F5
	for <lists+kernel-janitors@lfdr.de>; Mon, 22 Jul 2019 20:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbfGVS4g (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 22 Jul 2019 14:56:36 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47787 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726253AbfGVS4g (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Jul 2019 14:56:36 -0400
X-IronPort-AV: E=Sophos;i="5.64,296,1559512800"; 
   d="scan'208";a="392891366"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jul 2019 20:56:11 +0200
Date:   Mon, 22 Jul 2019 13:56:09 -0500 (CDT)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Kernel Janitors <kernel-janitors@vger.kernel.org>
Subject: Re: Script to spot some typo based on the file name
In-Reply-To: <4dd55830-6a54-22ee-573a-390d88e9dc6f@wanadoo.fr>
Message-ID: <alpine.DEB.2.21.1907221348390.5391@hadrien>
References: <460fd687-474f-8a3e-82f6-269eb5507f96@wanadoo.fr> <4dd55830-6a54-22ee-573a-390d88e9dc6f@wanadoo.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 22 Jul 2019, Marion & Christophe JAILLET wrote:

> Hi,
>
> Attached is a WIP script I've just written which tries to spot typos in a
> file, based on the filename itself.
>
> Yesterday, I've posted some finding done with this script.
> Today, I share if someone finds it useful, want to improve it or just want to
> take the idea.
>
> As, I'm not a bash guru, it is neither optimal, nor well written.
> But it seems to work as I expect.
>
>
> The name of a file can be a good source of information to spot typo in the
> code itself. This can help spot typo in comments or strings, but also wrongly
> named functions or constant.
> 3 checks are implemented. They can be disabled individually.
>
> The filename should sometime be tweaked a bit to only take the part before or
> after a '-' or a '_'. (some regex patterns are in the script for that, just
> comment/un-comment)
>
> The 2 last checks generate lot of false positives.
> It can find some few things, but honestly, the semantic should be improved.
>
>
> Just in case s.o. find it useful and want to use it to clean-up a few things.

It seems like a nice idea.  Based on another patch you sent, perhaps
something could be done with non-English words in general.  If there are a
few occurrences of XYZ in a file, but only one occurrence of XXZ, it might
be worth highlighting XXZ as a possible typo.  (I don't know what string
length and string distance would give the best results).

julia
