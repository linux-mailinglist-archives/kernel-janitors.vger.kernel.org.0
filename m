Return-Path: <kernel-janitors+bounces-7373-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F03A4F33F
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Mar 2025 02:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFA327A4EEE
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Mar 2025 01:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B0C14D28C;
	Wed,  5 Mar 2025 01:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tuf4utLm"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E2C14658D;
	Wed,  5 Mar 2025 01:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741136779; cv=none; b=eu9Upymr3bOWJ6ZKiwPJqXDRG8/b0Tz9yQm7Galg+GrGTX3WIe8+5KNtvoht+2Og/bPiL6nMo+RsYwgcIa8Mx8psL7nB5InNBIJnOwwREcX+exKyn5O4+Qj7GhgoWsgOib3Fl1Bdt/3lqyMrJC8uNIYT8qTHovD5T9u+rcoizsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741136779; c=relaxed/simple;
	bh=NFjI1EHuABG7s0eSffnKl9hWTBsGsWfNfqbWCI+12aw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSSkFnJFrncatiXg51OPdR/nPea2D4YXYaoR8LQ1i+cxcTVFCI06oWIBVrT8GJgp2dIKZ2bVfhSDnAIftclvBeV5MrbgdRqy1d1Tm+0ALGBJ7L2fGs5neOAAFKZXrpicsjya9s8MuA5n9XpoXYIHb9hq9zUX1ng/bYB7pqildgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tuf4utLm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED5BC4CEE5;
	Wed,  5 Mar 2025 01:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741136778;
	bh=NFjI1EHuABG7s0eSffnKl9hWTBsGsWfNfqbWCI+12aw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tuf4utLm8wRDgL8Ga/dAwN/B4O1akbW0V7KqoyMrYlnTCA3HsOqhdlF+q6dZE3fyC
	 M+vtntkhBDwypJ47u9mTKkTTEak1aJhZoJmycUpXto+hg37CXryNameXS8Pmn3i8t+
	 nB4tJvZLHLc+E+OCEnwl5tDBsr5/0uRHnH1GJWPnODYUev2VHMU8Y3A9P6+a57nXOi
	 uvcQ/Ev4AjR3vP4VtJeyWccPql7mjFErbHFnohmR9va3Df5vxxyIGnJ5+6+YQGHKaj
	 5BUDLSBxF1DLDsYO0KAPrmz7CHS26TR1ymkJU6x/Dmp5JXoU/tjJJGdKtYtj2wp7r7
	 Yy0KSyjhZvR1A==
Date: Tue, 4 Mar 2025 17:06:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Brett
 Creeley <brett.creeley@amd.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jacob Keller
 <jacob.e.keller@intel.com>, Paolo Abeni <pabeni@redhat.com>, Shannon Nelson
 <shannon.nelson@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org, Qasim Ijaz <qasdev00@gmail.com>, Natalie
 Vock <natalie.vock@gmx.de>
Subject: Re: [PATCH net-next] ionic: Simplify maximum determination in
 ionic_adminq_napi()
Message-ID: <20250304170616.22763ca3@kernel.org>
In-Reply-To: <cbbc2dbd-2028-4623-8cb3-9d01be341daa@web.de>
References: <cbbc2dbd-2028-4623-8cb3-9d01be341daa@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 1 Mar 2025 11:12:31 +0100 Markus Elfring wrote:
> Reduce nested max() calls by a single max3() call in this

max3() is literally a wrapper for max(a, max(b, c))
This patch is pointless.

