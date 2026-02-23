Return-Path: <kernel-janitors+bounces-10210-lists+kernel-janitors=lfdr.de@vger.kernel.org>
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH/ZDsbNnGnjKQQAu9opvQ
	(envelope-from <kernel-janitors+bounces-10210-lists+kernel-janitors=lfdr.de@vger.kernel.org>)
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Feb 2026 22:59:34 +0100
X-Original-To: lists+kernel-janitors@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA4F17DE4C
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Feb 2026 22:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02505311BC16
	for <lists+kernel-janitors@lfdr.de>; Mon, 23 Feb 2026 21:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4F837A48D;
	Mon, 23 Feb 2026 21:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bJM3WAk7"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456253783C5;
	Mon, 23 Feb 2026 21:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883625; cv=none; b=jdctUqqX7J9229tWg9VUKjT9ffVopM+/XLBLzRX8J1gQeWB30FG/nPSPKS7tvZR69qVw9tnOMvCE00c4rCz4eYBUk2wG999HGpPsSqDBYK0LPf7aiOVVyQYro/4TxR/ej2Sx3rxYV8F+UJo7aFPDAcdhFw0kUSvZbXhCjR/IyEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883625; c=relaxed/simple;
	bh=a47+wjzEFQM3mE5wXVcS4PxdztrWL6jwdpKX8/S97lc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qD7RBnRX0BuDINMGibYsF7EfduDXsUJ+sWC+Kh+jcxhchWfXTfEc7MpVwaIAZFWzM+e5nLruA3d9pM5i5A+TVq3ILd7/rb+ebxkwGH7UNpVvCcMuKj14u48jLdZ9VHShIeVUQ1xns0ojfao5sJAs+Du0SenBBLBf+VWWXmrYMkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bJM3WAk7; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A433040423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771883623; bh=02HXq/OpBLcQvKpjpOkKgJLkQHTj8Uut5lZbJ3ywpks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bJM3WAk77Oeg6Oqu0IUzwEG2TqKsl7A6gAY2CuCRKbU6GHjEL8DDwENv1pt4rKhgg
	 2UBEhQU92deOaiLC8RM/nkhqCbA7SmIphQOdUFJOV/dJlBDVJ/GAbm+cidsd4SKjZB
	 ApULdr4ufSLIal/R2LqIQdriui6AAQ4DoslLkLJTbm+dG3kCodinRhZXimMD7+v3Sr
	 z8Av8/+5HtRplEwe36Is+todPGjWkUrs2kwtazjIv1tp8JcZdYpCB0UAKwSLndcfrK
	 IbdEyRnus3hhTH98eJkEAYFnAFWPoTiNn6QrgmcLoXlL2DugBP3waH0qXLnro1kD9h
	 bg1y4+F59+WGA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A433040423;
	Mon, 23 Feb 2026 21:53:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Askar Safin <safinaskar@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] doc: early_userspace_support.rst: trivial fix:
 directory -> file
In-Reply-To: <20260220165238.4162735-1-safinaskar@gmail.com>
References: <20260220165238.4162735-1-safinaskar@gmail.com>
Date: Mon, 23 Feb 2026 14:53:42 -0700
Message-ID: <871pib3z4p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10210-lists,kernel-janitors=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,kernel-janitors@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[kernel-janitors];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 9DA4F17DE4C
X-Rspamd-Action: no action

Askar Safin <safinaskar@gmail.com> writes:

> Trivial fix.
>
> Signed-off-by: Askar Safin <safinaskar@gmail.com>
> ---
>  .../driver-api/early-userspace/early_userspace_support.rst      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
> index 61bdeac1b..60d1e1bc9 100644
> --- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
> +++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
> @@ -73,7 +73,7 @@ usr/gen_initramfs.sh.  This means that CONFIG_INITRAMFS_SOURCE
>  can really be interpreted as any legal argument to
>  gen_initramfs.sh.  If a directory is specified as an argument then
>  the contents are scanned, uid/gid translation is performed, and
> -usr/gen_init_cpio file directives are output.  If a directory is
> +usr/gen_init_cpio file directives are output.  If a file is
>  specified as an argument to usr/gen_initramfs.sh then the

"Trivial fix" is not a great changelog ... but I've applied the patch,
thanks.

jon

