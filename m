Return-Path: <kernel-janitors+bounces-379-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 691177F417E
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 10:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 216DF2817E3
	for <lists+kernel-janitors@lfdr.de>; Wed, 22 Nov 2023 09:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C362821372;
	Wed, 22 Nov 2023 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="hrbzriWg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Vt5Dn8hM"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A936B83;
	Wed, 22 Nov 2023 01:22:22 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 610CD5C0111;
	Wed, 22 Nov 2023 04:22:19 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 22 Nov 2023 04:22:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1700644939; x=1700731339; bh=ay
	8h41bmlYZ1BdZhviMyvO1VouxncVOl1ol7RHGvguc=; b=hrbzriWgfWicypi6oM
	BRZWopSWGxYO/uNJTDhtttfYkJzgG0DcNCRGQG6zIzELPvno/3iAzgsuKKdUyN0F
	IpCofc16WxUGnFkBchmgQkyOfz+vcUtgYLpuXvmGCS9trfgikMLd+4ZmXJYwn2WH
	fcd+rerHZTGaI+s/wTK1HTQTIcbMvNks9Z9Z/svkV88pgPoEyGAtCfxXAc842WFZ
	aP/TvDBgUwFV9yBELQ6/TSvEBeC8Oo56M+y8b4uBRjz6OLYJ7bdaMbu9ZoirxR2J
	bOEv3dtWwtCL9lMB28E288WaMQywvjStEKBmNNnA5WmiSbB0JeXZyKnrxzXoHxZc
	fv1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700644939; x=1700731339; bh=ay8h41bmlYZ1B
	dZhviMyvO1VouxncVOl1ol7RHGvguc=; b=Vt5Dn8hM28RK+U2AdrXoog5WhSem3
	T8PtkeQrqYdF5BrsyC7cVe7+6ldJRxU0K7vtwJke1HCUjCNs3YehMliGswxP+gk+
	Tb+4oxxpVd0Ho9JUyNg3nGhAu0WtY/r0WSwyatbJYO9dSyM6XB9YlWXVXqAccDns
	ytcUWUhVHaz9/lOwdHksGKTgKMKdhwRZ29/Fntll9hSfPIImtnSDZPz3DPLsgqnv
	JWMVo8XVhMYchv87BrpHOH/JUJ/5IfCWIzwSsZlBKPu12ERt+Ca7jrtGmrNmuS0y
	6fhe4TIsqUiIU3EyX5GS+iHFqZ51mg39Iv0QhpD3rh7Ebg08CULtS+1Qw==
X-ME-Sender: <xms:S8hdZS6cwdf3YcZmTieJXu70oi-CjiZ4BDVZ-4UHurehyCzu617aYQ>
    <xme:S8hdZb7vHvYV84KMKYyOZWPNVn_MEZ1UWf0cKqkSFlZtEd21K8W3Pa9hlYFe3D6Ex
    3oupLgt0QzX0nd_GMc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehuddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:S8hdZRcgGVWlwJTDjg3H9OwkDUhvIQqRJVAGVt92p7t9ark_eUXHgQ>
    <xmx:S8hdZfK_npqo-0uKQEjgHd8yOAb5XEv4-B-Q7SDC038bw_R7uM-j0w>
    <xmx:S8hdZWLqZoHzENjDjD-iV_7nRYgin8L880y5P6TTKsJbJSBVcYBa3g>
    <xmx:S8hdZS3PqjbhSPuw1OLRgVb-IUHFn0tGjEZE9F7gOMNKLEFidvMLjQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 224FDB60089; Wed, 22 Nov 2023 04:22:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1229-gdd3e08e26c-fm-20231121.001-gdd3e08e2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6270c14a-6b65-44f5-a820-43cb72f8f2b7@app.fastmail.com>
In-Reply-To: <20231122083047.12774-1-lukas.bulwahn@gmail.com>
References: <20231122083047.12774-1-lukas.bulwahn@gmail.com>
Date: Wed, 22 Nov 2023 10:21:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
 "Kalle Valo" <kvalo@kernel.org>, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: libertas: fix config name in dependency for SDIO support
Content-Type: text/plain

On Wed, Nov 22, 2023, at 09:30, Lukas Bulwahn wrote:
> Commit 4b478bf6bdd8 ("wifi: libertas: drop 16-bit PCMCIA support") reworks
> the dependencies for config LIBERTAS, and adds alternative dependencies for
> USB, SDIO and SPI.
>
> The config option SDIO however does not exist in the kernel tree. It was
> probably intended to refer to the config option MMC, which represents
> "MMC/SD/SDIO card support" and is used as dependency by various other
> drivers that use SDIO.
>
> Fix the dependency to the config option MMC for declaring the requirement
> on provision of SDIO support.
>
> Fixes: 4b478bf6bdd8 ("wifi: libertas: drop 16-bit PCMCIA support")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Good catch

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

