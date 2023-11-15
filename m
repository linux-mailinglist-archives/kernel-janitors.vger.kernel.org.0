Return-Path: <kernel-janitors+bounces-22-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBE57DB478
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 08:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284EC28138A
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 07:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9420D6ABF;
	Mon, 30 Oct 2023 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jUrdh3/4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sm4XNJ6s"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CA863C1
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:38:25 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73FF3A7;
	Mon, 30 Oct 2023 00:38:23 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1C6791FEDD;
	Mon, 30 Oct 2023 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1698651502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POOUX/d8rILNu4kY0NehNla8wNVcSgPqGmuaJwG6QVM=;
	b=jUrdh3/4R7K4A92i22xlDUBdw2eLsqEQnrpPTseRqpJcHtqBpx6Pck/IAWiGnRK713jayu
	lePMtm7c22JlK5ojW/8NP313b+fPW9dwAjvbYCFx/xMPatUT6V4HNNFZ8kZ6Yv8n41FoWP
	qTLiByj1JVt65kAEkOCkJAi/qsNhwSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698651502;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POOUX/d8rILNu4kY0NehNla8wNVcSgPqGmuaJwG6QVM=;
	b=sm4XNJ6sypINzyvdn2Ioc9TOg+IS7DwUrvRnGW2T09ld40zitJBgXufO3OpnsawWnwP482
	m7vS2E8gr3XeaiAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE169138F8;
	Mon, 30 Oct 2023 07:38:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id P3wUJmxdP2V+UAAAMHmgww
	(envelope-from <colyli@suse.de>); Mon, 30 Oct 2023 07:38:20 +0000
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH] bcache: Optimize sysfs_hprint()
From: Coly Li <colyli@suse.de>
In-Reply-To: <9b82413f1ca0b924cc139d945777e32dd22ffe41.1698575385.git.christophe.jaillet@wanadoo.fr>
Date: Mon, 30 Oct 2023 15:38:08 +0800
Cc: Kent Overstreet <kent.overstreet@gmail.com>,
 linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 linux-bcache@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF96F92E-B483-4FC7-B4DB-B9D76E44D9A7@suse.de>
References: <9b82413f1ca0b924cc139d945777e32dd22ffe41.1698575385.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> 2023=E5=B9=B410=E6=9C=8829=E6=97=A5 18:30=EF=BC=8CChristophe JAILLET =
<christophe.jaillet@wanadoo.fr> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> The size of what is in 'buf' is already computed by bch_hprint(), so =
skip
> these bytes when calling strcat().
>=20
> This easily saves a few cycles. (should it matter)
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Your change does save several cpu cycles, but hurts the readability. =
This is not hot code path, just let strcat to do what it was designed =
for.=20

Thanks.

Coly Li

> ---
> drivers/md/bcache/sysfs.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/md/bcache/sysfs.h b/drivers/md/bcache/sysfs.h
> index 65b8bd975ab1..798bcbeab0bb 100644
> --- a/drivers/md/bcache/sysfs.h
> +++ b/drivers/md/bcache/sysfs.h
> @@ -78,7 +78,7 @@ do { \
> do { \
> if (attr =3D=3D &sysfs_ ## file) { \
> ssize_t ret =3D bch_hprint(buf, val); \
> - strcat(buf, "\n"); \
> + strcat(buf + ret, "\n"); \
> return ret + 1; \
> } \
> } while (0)
> --=20
> 2.34.1
>=20


