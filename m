Return-Path: <kernel-janitors+bounces-2113-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C90873688
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Mar 2024 13:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C8BC28A413
	for <lists+kernel-janitors@lfdr.de>; Wed,  6 Mar 2024 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A9A8592F;
	Wed,  6 Mar 2024 12:33:47 +0000 (UTC)
X-Original-To: kernel-janitors@vger.kernel.org
Received: from 7.mo584.mail-out.ovh.net (7.mo584.mail-out.ovh.net [178.33.253.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6F1DA4C
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Mar 2024 12:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.253.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728426; cv=none; b=RKODRriHoJtgILOQUXMykpXX78LfFxUmJN1nASJjVsT60V98HtxsafmgOA4mg574kKAcl9osPyA6+MCjAeUN6tSj4/Q07w7xdbbkzLuFYFbiCKCp+dYMxKX6Q0FtB7m2/ApTitV49CVjcoDV0XMmCgZhEefKdKjkwzTByJ/EdSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728426; c=relaxed/simple;
	bh=T/ZFalMvsTIqIXH9CCmS4Q6/QVqPFJOqTdkBRjqsCZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nLv/IZR/hTMb19Ns2hBe12N042eFUqBdBqfi9lpLzcU7hUIWcU0Mz/jbR3n+zaguYgzi+i8C31djZS+PM+t+87z62Hc2LhiU1VlW4rn2wZPZ93vlv9gLx4ev+8CFgCIKKACO3gHGJSkzVWZryCYqdB6nBOuA7y8RF+/eKqSAX8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.253.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.176.128])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TqW8s36Sqz121D
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Mar 2024 11:55:41 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-6n4p5 (unknown [10.111.182.10])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4DE6D1FF02;
	Wed,  6 Mar 2024 11:55:40 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-6684bf9d7b-6n4p5 with ESMTPSA
	id ebVeDrxZ6GUteAAALhss6w
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:40 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R0040eb92394-62a9-4541-aed7-3e0ed99d4b9a,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: wsa@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <6ed30ecf43a4c8574aa6b9f93be50f3203a42850.1704465414.git.christophe.jaillet@wanadoo.fr>
References: <6ed30ecf43a4c8574aa6b9f93be50f3203a42850.1704465414.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] i2c: wmt: Fix an error handling path in
 wmt_i2c_probe()
Message-Id: <170972613724.1712532.15551713382249380033.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:37 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6466324643755526875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

Hi

On Fri, 05 Jan 2024 15:39:35 +0100, Christophe JAILLET wrote:
> wmt_i2c_reset_hardware() calls clk_prepare_enable(). So, should an error
> occurs after it, it should be undone by a corresponding
> clk_disable_unprepare() call, as already done in the remove function.
> 
> 

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: wmt: Fix an error handling path in wmt_i2c_probe()
      commit: 78c1dbed365217ee751531e24c18da77795074d9


