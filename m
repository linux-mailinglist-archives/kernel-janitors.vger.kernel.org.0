Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4CFE26014C
	for <lists+kernel-janitors@lfdr.de>; Mon,  7 Sep 2020 19:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731005AbgIGRDP (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 7 Sep 2020 13:03:15 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:13807
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730783AbgIGRDK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Sep 2020 13:03:10 -0400
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; 
   d="scan'208";a="358316533"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 19:03:05 +0200
Date:   Mon, 7 Sep 2020 19:03:05 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     Coccinelle <cocci@systeme.lip6.fr>,
        Dejin Zheng <zhengdejin5@gmail.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?Q?Re=3A_=5BCocci=5D_=5BPATCH_v2=5D_Coccinelle=3A_api=3A?=
 =?UTF-8?Q?_Add_SmPL_script_=E2=80=9Cuse=5Fdevm=5Fplatform=5Fget?=
 =?UTF-8?Q?=5Fand=5Fioremap=5Fresource=2Ecocci=E2=80=9D?=
In-Reply-To: <4b505afc-ae48-d8eb-f4e1-8e3f7192f73d@web.de>
Message-ID: <alpine.DEB.2.22.394.2009071900450.2476@hadrien>
References: <25b804fd-0d04-475d-f614-26c03c9fd544@web.de> <5f9fdd59-4b0b-1cb5-c3a2-92efc5bb3841@web.de> <4b505afc-ae48-d8eb-f4e1-8e3f7192f73d@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On Mon, 7 Sep 2020, Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 7 Sep 2020 18:38:04 +0200
>
> Another wrapper function is available since the commit 890cc39a879906b63912482dfc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Provide safe design options for the adjustment of affected source code
> by the means of the semantic patch language (Coccinelle software).
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>
> v2:
> Julia Lawall requested to omit case distinctions (disjunctions) from
> the first SmPL script.
> The usage of different expression metavariables for the first parameter
> of function calls was too questionable for the proposed source
> code transformation.
>
>
>  ...vm_platform_get_and_ioremap_resource.cocci | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
>
> diff --git a/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci b/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
> new file mode 100644
> index 000000000000..319583716ac8
> --- /dev/null
> +++ b/scripts/coccinelle/api/use_devm_platform_get_and_ioremap_resource.cocci
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/// Simplify a function call combination by using a known wrapper function.
> +//
> +// Keywords: wrapper function conversion ioremap resources
> +// Confidence: High

Shouldn't there be some options?  --no-includes and perhaps
--include-headers would seem reasonable.

Please also remove all of the rule names except for "or" which is
necessary.  The rest just add clutter and make it harder to find the
useful information, which is the depends on.  Rules only need names if
some other rule inherits their metavariables.

julia

> +
> +virtual context, patch, report, org
> +
> +@display depends on context@
> +expression base, device, index, resource;
> +@@
> +*resource = platform_get_resource(device, IORESOURCE_MEM, index);
> + base =
> +*       devm_ioremap_resource
> +                             (&device->dev, resource);
> +
> +@replacement depends on patch@
> +expression base, device, index, resource;
> +@@
> +-resource = platform_get_resource(device, IORESOURCE_MEM, index);
> + base =
> +-       devm_ioremap_resource
> ++       devm_platform_get_and_ioremap_resource
> +                             (
> +-                             &
> +                               device
> +-                                    ->dev
> +                              ,
> +-                             resource
> ++                             index, &resource
> +                             );
> +
> +@or depends on org || report@
> +expression base, device, index, resource;
> +position p;
> +@@
> + resource = platform_get_resource(device, IORESOURCE_MEM, index);
> + base = devm_ioremap_resource@p(&device->dev, resource);
> +
> +@script:python to_do depends on org@
> +p << or.p;
> +@@
> +coccilib.org.print_todo(p[0], "WARNING: opportunity for devm_platform_get_and_ioremap_resource()")
> +
> +@script:python reporting depends on report@
> +p << or.p;
> +@@
> +coccilib.report.print_report(p[0], "WARNING: opportunity for devm_platform_get_and_ioremap_resource()")
> --
> 2.28.0
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
