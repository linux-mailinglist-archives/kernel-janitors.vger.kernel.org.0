Return-Path: <kernel-janitors+bounces-3271-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A78CD8A5
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 May 2024 18:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FAF1B23A9A
	for <lists+kernel-janitors@lfdr.de>; Thu, 23 May 2024 16:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499A51CA92;
	Thu, 23 May 2024 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="kcl3eoyE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0775C2C1AC
	for <kernel-janitors@vger.kernel.org>; Thu, 23 May 2024 16:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716482738; cv=none; b=UisHacHDT1647yTLVPDgZBAVrICiPfpc/TAjwOCnzeAyt19e3598uAqcG/8TgqYs5hU21hQl8k387jO/nRE3cj+L1K81UKVcZ86bBsGCqW5atH8kKTtlkZRTKgqmCWcUXS6qycnsd2+egRKteoodfsxBsjcbnSga3aYEUw16fow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716482738; c=relaxed/simple;
	bh=PeE2Iv1cUElnBiThT4jIFU1ihOHGm8Z1qxGwKgRJTAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rql7//EnKoLiRNZs2VolmGbtYQX20UA58ZoiBPIci5rL2OnZSEzIGI/h0QMdi01E+D7HH3h3HiZuI1lKiFO27CQsFwmbo6PKQAxwQ/r1GB08L1m/aNVn8TYvoKyE4OlN8h/4AKWeMvvqjEhvfBfmn+GbmGah5dy/Zcmwq7vbU14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=kcl3eoyE; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-108-7-50-195.bstnma.fios.verizon.net [108.7.50.195])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 44NGjJlI031728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 12:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1716482722; bh=76A2SchJx/XQs3JI5IruaZJ74cXb24Hwn2+K3+4a8+k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kcl3eoyEwTqIqwlQ+1yfhnlEuUVOR+ebptXPpIwcNZjZxh0DsqTXIH+B4SMWoy3YU
	 Jvjy4Lf4duH+yEuQMuLMdZOn1t4IHxW3RtrizNYNv9fbpjKRIRPOpke6chKK7V+nAC
	 WTec0mnUr5r9cQ2lbKiPBPUKCFBuTTJyNi/IRMjLo/QuNmpFC7AmR2UoAIRhdS8SGu
	 gVoGr2bSAea3BqQC3rb8TO+FwVp9j8y47UZ+LgdltsylDRxOsLBf0A5sEuul9U6KpF
	 LbzdLJh/sn34Dv8tqLVbMnbIRi/M8a67AF//y1wElGyqRF/63QrgnPZ0L/h4N4w4hg
	 p8xss9mQEH6Jw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 9E62715C0225; Thu, 23 May 2024 12:45:19 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Matthew Wilcox <willy@infradead.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ext4: fix error pointer dereference in ext4_mb_load_buddy_gfp()
Date: Thu, 23 May 2024 12:45:16 -0400
Message-ID: <171648267844.923789.4231199989954274163.b4-ty@mit.edu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <eaafa1d9-a61c-4af4-9f97-d3ad72c60200@moroto.mountain>
References: <eaafa1d9-a61c-4af4-9f97-d3ad72c60200@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 May 2024 18:22:53 +0300, Dan Carpenter wrote:
> This code calls folio_put() on an error pointer which will lead to a
> crash.  Check for both error pointers and NULL pointers before calling
> folio_put().
> 
> 

Applied, thanks!

[1/1] ext4: fix error pointer dereference in ext4_mb_load_buddy_gfp()
      commit: c6a6c9694aadc4c3ab8d89bdd44aed3eab1e43c6

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>

