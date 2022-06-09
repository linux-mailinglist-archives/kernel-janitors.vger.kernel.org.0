Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D35E545115
	for <lists+kernel-janitors@lfdr.de>; Thu,  9 Jun 2022 17:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243520AbiFIPlU (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 9 Jun 2022 11:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236178AbiFIPlU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 9 Jun 2022 11:41:20 -0400
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86942424A0
        for <kernel-janitors@vger.kernel.org>; Thu,  9 Jun 2022 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pgG0eA2vc/1dAlCwvkKaeMSKAA9qNytf28HYhRuJL28=;
  b=rSUp77YvJ63LjttEXhuoyMEEveSbwVdbTCIAjYtP7yfjdqZ1fRymRhdc
   yrYKHCHaAWOfqbDPd0CL5/U9XoRBk84q1vT59iCQLWoDI2b+tuNMdi9KB
   waYrqBEbGu+U9nf75Ih0VSdbPwNKlJr9a+Hjnd+mJcsmTkIPwKoSASdao
   4=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,287,1647298800"; 
   d="scan'208";a="16348258"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 17:41:15 +0200
Date:   Thu, 9 Jun 2022 17:41:14 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     Markus Elfring <Markus.Elfring@web.de>
cc:     =?ISO-8859-15?Q?J=E9r=E9my_Lefaure?= <jeremy.lefaure@netatmo.com>,
        cocci@inria.fr, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>
Subject: Re: coccinelle: ifaddr: Find address test in more complex
 conditions
In-Reply-To: <15a253a6-469b-9632-8c7d-983554604451@web.de>
Message-ID: <alpine.DEB.2.22.394.2206091740520.2380@hadrien>
References: <AS8PR03MB760365A0DE3A8522136471BE93A59@AS8PR03MB7603.eurprd03.prod.outlook.com> <415ca02b-9618-b447-6471-6bcd0e2215e8@web.de> <alpine.DEB.2.22.394.2206072138160.2960@hadrien> <15a253a6-469b-9632-8c7d-983554604451@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-267814770-1654789275=:2380"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-267814770-1654789275=:2380
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 9 Jun 2022, Markus Elfring wrote:

>
> I don't really understand the above, but it made me realize that actually
> the following is sufficient:
>
> @@
> expression x;
> @@
>
> *&x || ...
>
> This forces &x to appear as a test expression.  There can be 0 or more
> occurrences of ||, so eg &x && y is also matched.
>
>
> How does this promising feedback fit to the following information from
> the software “Coccinelle 1.1.1” (OCaml 4.14.0)?
>
> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Coccinelle/Probe> spatch --parse-cocci show_address_determination_in_checks-20220609.cocci
> …
> @display@
> expression x;
> @@
>
>
> (
> *&*x *|| *...
> |
> *&*x *!= *NULL *|| *...
> |
> *&*x *|| *...
> |
> *NULL *!= *&*x *|| *...
> )
>
>
> No grep query
>
>
> Would another transformation be needed for the omission of trailing binary operators
> (according to the shown combinations with SmPL ellipses)?

I don't know what you mean.  How about trying an example?

julia
--8323329-267814770-1654789275=:2380--
