Return-Path: <kernel-janitors+bounces-6915-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB5DA17561
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jan 2025 02:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 402051883F1A
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jan 2025 01:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462B94086A;
	Tue, 21 Jan 2025 01:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH/mKDMo"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980027464;
	Tue, 21 Jan 2025 01:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737421486; cv=none; b=o8EDlYncoQfaKkJQ7IqfLfdSk+hiM2jTTHidaSrCJdl4lwADye6H1tTgiRLPVk/V4iziv4vWBo2snH83nJRPxx7hWk39wKIf09Ek4BTcKK6RiFJtLaVR6B0F1pj9IiKZDv4WqGAftHxhANYtxLZfaYAD9UqMTsxVG0Nng/XMwmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737421486; c=relaxed/simple;
	bh=41fV2LyyQENdncIHSowB0rUO0K9rkbPCy1KcLAcGsvs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HOdeFAkL5amtwuoAtSS+fM68RShLiFVYwkmX1NjvkH0DZGCX1ITd/LC3pJLYKklHDUO1WvSqeAE7R2oGCJpBB8DYXe9cO6SokptuI2vGq99ErIZA+jwaedJ6ceBl2k8HB70qV7ks1OkHod/gvASzwr4g7xwzxCHcyL0Ao8vHQuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH/mKDMo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F61FC4CEDD;
	Tue, 21 Jan 2025 01:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737421486;
	bh=41fV2LyyQENdncIHSowB0rUO0K9rkbPCy1KcLAcGsvs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WH/mKDMogQtPEr8Les67b7Sik0cbDTQj2yUPjDd6jOma9hSxqUKzSL8PmLaXttWjC
	 MjHr6tqhvkuXcvWJGFY+LWD4f/SnwfIu+xYWEazo/RsmVr2Y86rbBNNYwD9AHAIy+P
	 g4iuoAsgaumFfXDSpwJ53D0AeFxDjHfLuNj2bES+Gz9/HTd1BY+h9o7hhrL2FFzT0S
	 kxdubGIZne0++p4cvM5P/np41LZfk7VgNjZJHnuQL5hnM9+ub4OEh7Q605/xM3ccpw
	 ZWN5AePt7PfpIE7rXPryL+UyMTz8rbP+KwyWzsjNHf7zMpX8FWsdPgQ/8OHfnx1kwS
	 U61gPgOPi4GlQ==
Date: Mon, 20 Jan 2025 17:04:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Francois
 Romieu <romieu@fr.zoreil.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com
Subject: Re: [PATCH] net: mvneta: fix locking in mvneta_cpu_online()
Message-ID: <20250120170444.4e9128ff@kernel.org>
In-Reply-To: <8abc7eed-028e-4fe3-a319-e0936c6bf9e7@oracle.com>
References: <20250121005002.3938236-1-harshit.m.mogalapalli@oracle.com>
	<8abc7eed-028e-4fe3-a319-e0936c6bf9e7@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jan 2025 06:23:16 +0530 Harshit Mogalapalli wrote:
> On 21/01/25 06:20, Harshit Mogalapalli wrote:
> > When port is stopped, unlock before returning
> >   
> Missed adding a period at the end of sentence. Should I send a V2 ?

It's alright, we can add the period when applying.

