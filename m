Return-Path: <kernel-janitors+bounces-6472-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF939C8C2D
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Nov 2024 14:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF8181F222A2
	for <lists+kernel-janitors@lfdr.de>; Thu, 14 Nov 2024 13:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05EA29429;
	Thu, 14 Nov 2024 13:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="ZqLy75PV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47EA95C
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731592433; cv=none; b=IdheSfJybtjVEvzc3XJxCpra5DAmF6/J7U3/ydz0rj4ybJY7DvQ9PzVFvOp2usOKUS4FmjNsGAvu3DpW8uVDJil/OEcasuR6sx6ZOuTChudJiHoATlIvhiq/Q/T+r1r4mE87I99L+2z/+gFzQMYWXLAC0E1pxdh2lsYthrfTSvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731592433; c=relaxed/simple;
	bh=sPde+t62qlw1KWYPfaZdoPayAdU01Tu8LdaBxK0s168=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmsQnHsH3zKgJRcIlVJgZ7FE/aGBMbWa6oBkd13V/lMnFK1tYGq71C9XoU5BXe4XQiFd5kzKvG5CieeHZlcdbkPGxz9xpqhxfgBmp5ujRxnRvgvGsKFYnop7nHXFpTzCG9VLv4HRedourN4StwIC3ssLrK2XMr1WJbYJxRPtL+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=ZqLy75PV; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from cwcc.thunk.org (pool-173-48-113-132.bstnma.fios.verizon.net [173.48.113.132])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 4AEDrhY2001791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 08:53:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1731592426; bh=GEJgaWVohTOKgKgeXKTN1Tk2qXz4gLesqNEzgdwa5ck=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZqLy75PVkPtk11xWOx5zN1f3rPKrdUY4iIxdGFVmaxmAZTlPlw8N420HjyQ1Gf0YY
	 nJl2k1jUl7Mpv5IFzEP0MPh6t1MMlxzhHrIrHfy3TKzNHgLOTQhtVjSOggFuTlJdQK
	 IUsMifkjQg3jK5e05srIVTfsRGRZE2FvEpH55l4VqNHMxlHuO/5K4rnaenuBVX7y+e
	 a3kC4xKeHDT5RNY7wTPysTDghzt+neYhzY3F8JyYhGBaCh0gzx0X9Nw7+dcPHJgKYJ
	 1Dm2M22S4pwHopCuu7W9pV6F5XKFuoTiwWJNd8QRlkJI7yUHuAaoIcz2ap3vrAFb4j
	 SvG5eQ4Oflzgg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 463EB15C136B; Thu, 14 Nov 2024 08:53:43 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Ritesh Harjani <riteshh@linux.ibm.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
        linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ext4: cleanup variable name in ext4_fc_del()
Date: Thu, 14 Nov 2024 08:53:35 -0500
Message-ID: <173159220754.521904.5429569345801125844.b4-ty@mit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <96008557-8ff4-44cc-b5e3-ce242212f1a3@stanley.mountain>
References: <96008557-8ff4-44cc-b5e3-ce242212f1a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 11 Oct 2024 22:43:44 +0300, Dan Carpenter wrote:
> The variables "&EXT4_SB(inode->i_sb)->s_fc_lock" and "&sbi->s_fc_lock"
> are the same lock.  This function uses a mix of both, which is a bit
> unsightly and confuses Smatch.
> 
> 

Applied, thanks!

[1/1] ext4: cleanup variable name in ext4_fc_del()
      commit: 27349b4d2ed072cabedd5115f0542b3b7b538aa8

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>

