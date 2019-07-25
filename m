Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C89B17500D
	for <lists+kernel-janitors@lfdr.de>; Thu, 25 Jul 2019 15:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390527AbfGYNsg (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 25 Jul 2019 09:48:36 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:54090 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389122AbfGYNsg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Jul 2019 09:48:36 -0400
X-IronPort-AV: E=Sophos;i="5.64,306,1559512800"; 
   d="scan'208";a="393302470"
Received: from c-73-22-29-55.hsd1.il.comcast.net (HELO hadrien) ([73.22.29.55])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 15:48:32 +0200
Date:   Thu, 25 Jul 2019 08:48:30 -0500 (CDT)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Laight <David.Laight@ACULAB.COM>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/2] string: Add stracpy and stracpy_pad mechanisms
In-Reply-To: <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
Message-ID: <alpine.DEB.2.21.1907250847440.2555@hadrien>
References: <alpine.DEB.2.21.1907242040490.10108@hadrien> <7e489aa8-95ea-b3b0-9023-ba284212977f@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Thu, 25 Jul 2019, Markus Elfring wrote:

> > @r@
> > identifier f,i1,i2;
> > struct i1 e1;
> > expression e2;
> > position p;
> > @@
> > \(strscpy\|strlcpy\)(e1.f, e2, i2)@p
>
> I have got the impression that the replacement can work also
> without an inherited position variable at the end.
> How do you think about to omit this SmPL rule then?
>
> Can it be nicer to reduce duplicate SmPL code a bit?

Huh?  Rule 2 is important, to ensure that ths size is correct.  Without
rule 1, how can rule 2 be checked?

julia
