Return-Path: <kernel-janitors+bounces-4572-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8E92D23D
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 15:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EE028235B
	for <lists+kernel-janitors@lfdr.de>; Wed, 10 Jul 2024 13:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479E0191497;
	Wed, 10 Jul 2024 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Wtv5WKeK"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5C983CD4;
	Wed, 10 Jul 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720616770; cv=none; b=FEe4nOa68E8erV738hNJLxxUfOnEyMJBI86LAJqeCA5Wo++wQopyO3Yu4CdsCKo5xAX2O57nWcaR7CvRTvIzvS58JY8lSV+7hUsjRaZXPJJrFhwKyFvcHH3TvghOe8VepKvssqZsY233wKg4xqRECcPpYOHPgVvARU54KRz7o64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720616770; c=relaxed/simple;
	bh=mgA99OrDmthPsDPhXumxSed5OSOz0lcBLKjYOBeh/vM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=P9KM0hnaa4ztYJ49x2/hw+xJiEtKZr/xNbfe4t/jWHLgDdY1uhQAJwXUOEmCrOYf1Q8+j60/DEmjW2SwbVP2Dp/zg3d+7kWHUFiSZV7JR8Fku5tpp9ywNVvr7H52jshtxaSKt/lm84fIw2j9g85QiY5Gm8rrCmhq4nIzEnL++oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Wtv5WKeK; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1720616734; x=1721221534; i=markus.elfring@web.de;
	bh=hL1FGV0d+/uNuT5MwoYkBSDKdQE8pznXZfxl1D6esK4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wtv5WKeKXhTZ4xKMJdhVn4hR0512X93slSKmuJcIJq3zP4UTGggQGgS/rwS7KW7A
	 fWmPHQFZnmGKE5po8BZuXyWUjGeWcH7uKkXCcKLV0WrEuucuyxISWs55EOkfvLQbF
	 xpkJZwjHYvT0YsnNwh+yXvk3+Db8gY3XxyKLz6+IkV51bT2ygM1+FbHEkuutUY1zl
	 O/+b9NQHt8VooN5QiRor4c2mH6MG3Sxv52ajrp9ghTg9KVMWJ3JhbaME2nNb3CSsd
	 VtQXtqPNUZS20uh8njvx3uEcnZA03SjN4ANAPI2RlDGiBkxQqU3cWH1eDYiVy//rw
	 t3WkhWLnopmmo7M6IA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MD5jp-1sadhP2Yi1-00DHGg; Wed, 10
 Jul 2024 15:05:34 +0200
Message-ID: <17c94d87-e260-4155-90c1-b7e5013ac69e@web.de>
Date: Wed, 10 Jul 2024 15:05:31 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Christophe Lombard <clombard@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ian Munsie <imunsie@au1.ibm.com>, "Manoj N. Kumar" <manoj@linux.ibm.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Shuah Khan <shuah@kernel.org>, Wei Liu <wei.liu@kernel.org>
References: <20240710103352.1890726-1-make24@iscas.ac.cn>
Subject: Re: [v2] cxl: Fix possible null pointer dereference in read_handle()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240710103352.1890726-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ySccpis36z6zCEn3Lvza8Bcw69K9CLTO951Rfrr+vzx9/WjUznR
 uBGLzfKx31PWoZiRB7dopUjsxoO0LOxfLLn4qYbLDy1tjwFRFR18KxbDMxFvi5MN48BHBPQ
 miagwSx+EDmvQYcvoizxkyvQjC5+j5OC437GHMMocZo4AYMnYa8QXKcpxrrhdIXySYhjuF5
 a0sHalsGI2NtM8CUfLAHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QlxgUnxO+Gg=;x1/tJ3UEsXUlj19rmtzQQ0Bu+/G
 YIcvK+OTSSc01X209tkGyk5j8jwQlXZ32ANqTTIePu5iRihf4ut5PA3mR7P+FWxVwabR4HXzQ
 17Wscigeq99PSTCarfj4XqQ/Z8C4YRVLrBSDK5+9Fjd7HL8o9JSxFdluCYO0wT3lVPYH/BQca
 uf0lZpBzQjqf5cybjn2CSqA8HZHEBxhOTAx+gNqI5PWoEjsrMdAp4voUezMcf23rHXn181CM3
 Z1Emz5epnsZfAegPh3EQUeAS7Q0CkLrLfa2aADvyltNUTxIF4EArIC2ssrICGKEXBDCLBruPv
 eQvNRztTrwHhiAmdJpA3fqnpshh2+yl9eqbM+UqUgy/vqKrGmI34iAhz7yTy0Mkew6JOqclvo
 lMuHgPYa1nsnyuifDQr7bWVlAIHcWrgaaJzRdpfBpLmI/Nwqtoc68LHCAf75ozIpiIFauqz/6
 VL2SewEm9CM7hgs0Hclh2ddtfgyBFbPRXf35itDLjcKS2qO90FuDCW6Oe3qm5T/fwd3Q6nUPd
 n8smSTA6h59vpOccMJekDgxsO222HBG+DEF4h5m6d7RnpzqMUma5y+s7Vp5kQhqCN+lgjGjMg
 vt4YTnfgcRcw1NgAp2t/1e6ydafGPLJFtOgBaGiL4ZsxT5uVLqZu6KiFdEqyGwPjYdtS+yHlF
 uMmnbU+hIUH4YEpBswED5dCiHnRdhF4ojLT24KlMkbxnW4IhwneZ/FrRq4xN1sfeMJYhSraVe
 381f0ddaMdKzSNPHJuakGeAS+cKIOG4qq3W+LUulGRiCCfa8W+poZUgL3P/Cx+SXWb+ogIAa6
 IPsjOQ09tJ/I3rEl8xtJsHkg==

=E2=80=A6
> - The potential vulnerability was discovered as follows: based on our
> customized static analysis tool,

I became curious in which time range further corresponding information wil=
l be published.


>                                  extract vulnerability features[1],

Various software corrections were published through the years.

Several error (or weakness) categories are known already.
https://cwe.mitre.org/
https://wiki.sei.cmu.edu/confluence/display/c/


> and then match similar vulnerability features in this function.
> - Reference link:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/com=
mit/?id=3D2d9adecc88ab678785b581ab021f039372c324cb

Another reference format can be helpful also for the commit c534b63bede6cb=
987c2946ed4d0b0013a52c5ba7
("drm: vc4: Fix possible null pointer dereference") from 2024-04-15.

Regards,
Markus

