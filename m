Return-Path: <kernel-janitors+bounces-4934-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E5949A39
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Aug 2024 23:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B181CB21176
	for <lists+kernel-janitors@lfdr.de>; Tue,  6 Aug 2024 21:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF99165EFB;
	Tue,  6 Aug 2024 21:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Wjz+hN/T"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D738D824A3;
	Tue,  6 Aug 2024 21:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722979913; cv=none; b=tuArEu9kfe4v6zW4At9/Iy7U+sdkoaOHmG1RAOteypQJNAqW1XfFpJC/Sjt1In41xYeXUcEy7X7+Uncl3TfO9eyIGflJxCDeUnATv5p4BT+WZ+0XMLPAlwpeXVRBAmZhH7PGKWM7650JB5GkGuJpYBBlme2zTgtUMzBmb81gmtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722979913; c=relaxed/simple;
	bh=FwK36ah26nQK4P5Nju4BLZcO9cGzgqakm2U5iwSxAkM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZj3ggPgOFyRpLZumSTAlVzvr3AD9uBvxnEDODBiKWFi44wblAhmPsb6V5uucLw6gb1HR0Z3WKixpHqLLkxT3bunh4B3i0mC9LIw8o8c1Nn54BVlSz7sbxm54XCdxELARVughU18LyWV8raUXVOBHhuYQnVU27FYJVD3e6TAeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Wjz+hN/T; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 476LVhGb026046;
	Tue, 6 Aug 2024 16:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722979903;
	bh=+wUl+GeiKRh9stMga5epj0nB9x1SfRtytiwkTrjRGXU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Wjz+hN/TvWHaI2wwVue0wotVjga/xAehisbaFm70wFN14MsH6PC5H1zqS3/ycKLlK
	 02mAtF9DAZrtmnY5XW7xK102h0ocFxTBj831+pojKFVdkm4BZgsPzPa5I8H1RyBXWu
	 XoVtJZX66Oz0bNxYmAHKnR6leKHBfmBroumgTs+E=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 476LVhTk017480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Aug 2024 16:31:43 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Aug 2024 16:31:42 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Aug 2024 16:31:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 476LVh6Z081346;
	Tue, 6 Aug 2024 16:31:43 -0500
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: k3-ringacc: Constify struct k3_ring_ops
Date: Tue, 6 Aug 2024 16:31:40 -0500
Message-ID: <172297970584.486396.3910901501413905475.b4-ty@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cb9dfc18cdf890afa2c53cd74b0b330d6f1c30ab.1720546863.git.christophe.jaillet@wanadoo.fr>
References: <cb9dfc18cdf890afa2c53cd74b0b330d6f1c30ab.1720546863.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Christophe JAILLET,

On Tue, 09 Jul 2024 19:41:29 +0200, Christophe JAILLET wrote:
> 'struct k3_ring_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   17090	   3304	     32	  20426	   4fca	drivers/soc/ti/k3-ringacc.o
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: k3-ringacc: Constify struct k3_ring_ops
      commit: d9483b44c94eba6fa7451caf27cc7e993c8cc568

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


