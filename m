Return-Path: <kernel-janitors+bounces-10261-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMYeGP62rmnMIAIAu9opvQ
	(envelope-from <kernel-janitors+bounces-10261-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Mon, 09 Mar 2026 13:03:10 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E2238612
	for <lists+kernel-janitors@lfdr.de>; Mon, 09 Mar 2026 13:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0537301AA96
	for <lists+kernel-janitors@lfdr.de>; Mon,  9 Mar 2026 12:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17603A7F56;
	Mon,  9 Mar 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="UgjiauK/"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54472359A81;
	Mon,  9 Mar 2026 12:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057662; cv=none; b=B3uOLdf5cfqLttEFDWvDBJaqjhbdsYg/ZGVxH+B48ViPv/UHbWJ6tyVkRpk3sHbTaez88hkI6GufNTF5buGbddnBLTsN5NB/Es1qPpyGU3NulUGrv4nS1w1rGQVD80ABjuFhLraFN5O7PpSDs/Dn2Ol/Ta3nHpg85SGyR41lk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057662; c=relaxed/simple;
	bh=2Q5vE+DJ6P2Avog0kIHAAYkrVPHu1YnNhMLWWJjbKck=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U5Foyi+h8VLnuakFS2j6dkCJO94TJub098Xc+o3EuowMRbEsIZsNc9iSCM87Qd9eolKF5+INvnS6+xve8LBj1mig0V3f8YvMP12ryvj/3C7fI4lWLqc1rYIl9VPvoRjJ9gkW+SB19WCoUZbBu02f1jleb/2X9QbKrZo3UTXMNFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=UgjiauK/; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7nNx4Iyc2/imBw5Tui/WljzGJuysqz2B4nsrBQSnvGI=;
  b=UgjiauK/q4UEc9KFJOBw74x9GWTU/fNh83zClssbaXqlYLNTDKet9/Wt
   X7ZrK5DDAJ9+l7+knijAulBettEUJB1c828JfiEwZVeNSNd89lkwoxVss
   lAYPdubQil9/EbJmy4ZkSzfh+de55TFTHkuKSHd9W3E0yLRBeyJpVtCwm
   g=;
X-CSE-ConnectionGUID: E4RQBa7yRuuOIViRAvxgaQ==
X-CSE-MsgGUID: ANJlQXodTZSLqBW6Aspzew==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,109,1770591600"; 
   d="scan'208";a="266876557"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 12:59:48 +0100
Date: Mon, 9 Mar 2026 12:59:48 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Markus Elfring <Markus.Elfring@web.de>
cc: Alejandro Colomar <alx@kernel.org>, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
    kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
In-Reply-To: <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
Message-ID: <4aa2fc38-3c32-75a1-161-1c90709252be@inria.fr>
References: <cover.1772752564.git.alx@kernel.org> <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org> <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1303160379-1773057588=:9033"
X-Rspamd-Queue-Id: 5D7E2238612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10261-lists,kernel-janitors=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[web.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julia.lawall@inria.fr,kernel-janitors@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[kernel-janitors];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[inria.fr:dkim,inria.fr:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1303160379-1773057588=:9033
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Mon, 9 Mar 2026, Markus Elfring wrote:

> …
> > This script makes it easy to find more places where that macro should be
> > used.
>
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.0-rc3#n94
>
>
> …
> > +++ b/scripts/coccinelle/misc/array_end.cocci
> > @@ -0,0 +1,93 @@
> …
>
>
> > +// Confidence: ???
>
> I hope that a more reasonable value can be determined for this information.
>
>
> …
> > +// Comments:
>
> Please omit such an empty field.
>
>
> …
> > +@i@
> > +@@
> > +
> > +#include <linux/kernel.h>
>
> I doubt that such an SmPL rule would be required.
>
>
> > +
> > +//----------------------------------------------------------
> > +//  For context mode
> > +//----------------------------------------------------------
> > +
>
> Please omit such extra comment lines.

No problem to put such comments.

>
>
> > +@depends on i&&context@
> > +type T;
> > +T[] a;
> > +expression b;
> > +@@
> > +(
> > +* (a + ARRAY_SIZE(a))
> > +|
> > +* (&a[0] + ARRAY_SIZE(a))
> > +|
> > +* (&a[ARRAY_SIZE(a)])
> > +|
> > +* (&a[ARRAY_SIZE(a) - b])
> > +)
>
> Extra space characters may be omitted directly after SmPL asterisks.

No concern about the spaces either.

>
>
> …
> > +@r depends on (org || report)@
>
> You may omit parentheses here.
>
>
> …
> > +@script:python depends on report@
> > +p << r.p;
> > +@@
> > +
> > +msg="WARNING: Use ARRAY_END"
> > +coccilib.report.print_report(p[0], msg)
>
> Would the following command variant be a bit nicer?
>
> coccilib.report.print_report(p[0], "WARNING: opportunity for ARRAY_END()")

Either way.

julia
--8323329-1303160379-1773057588=:9033--

