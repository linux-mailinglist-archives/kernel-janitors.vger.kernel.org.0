Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D24149C82
	for <lists+kernel-janitors@lfdr.de>; Sun, 26 Jan 2020 20:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbgAZTXE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 26 Jan 2020 14:23:04 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:63695 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgAZTXE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 26 Jan 2020 14:23:04 -0500
X-IronPort-AV: E=Sophos;i="5.70,366,1574118000"; 
   d="scan'208";a="433065460"
Received: from ip-241.net-89-2-7.rev.numericable.fr (HELO hadrien) ([89.2.7.241])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jan 2020 20:23:02 +0100
Date:   Sun, 26 Jan 2020 20:23:01 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     Kernel Janitors <kernel-janitors@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [RFC] Simplify flush_workqueue/destroy_workqueue pattern
In-Reply-To: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
Message-ID: <alpine.DEB.2.21.2001262016340.2576@hadrien>
References: <c610718c-4e98-749b-13a8-c23f57988383@wanadoo.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2016873295-1580066582=:2576"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2016873295-1580066582=:2576
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sun, 26 Jan 2020, Christophe JAILLET wrote:

> Hi,
>
> According to description of 'destroy_workqueue()':
>    "Safely destroy a workqueue. All work currently pending will be done first"
>
> Looking deeper at the code, it turns out that the call chain is:
>        destroy_workqueue
>    --> drain_workqueue
>    --> flush_workqueue
>
> So, calling explicitly 'flush_workqueue()' before 'destroy_workqueue()' looks
> redundant.
>
> Using following coccinelle script spots ~90 occurrences, in ~80 files, which
> can be simplified.
>
> >>>>>>>>>>>>>>>
> @r@
> expression e;
> @@
> -    flush_workqueue(e);
>      destroy_workqueue(e);
> >>>>>>>>>>>>>>>
>
> This is way to much for me because my patch submission process is mainly
> manual.
>
> If you agree with my analysis, think that removing these redundant calls is
> useful and have a much more automated patch submission process than me (or
> just have time :), please feel free to submit patches.

The Coccinelle distriubution contains a program splitpatch (make
splitpatch in the tools subdirectory) that can be used for cutting up
patches and sending them to their various maintainers.  There is a file
tools/README.splitpatch that explains how to use it (although I am not
sure that this README is completely up to date...).

julia
--8323329-2016873295-1580066582=:2576--
