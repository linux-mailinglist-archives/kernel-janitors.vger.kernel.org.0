Return-Path: <kernel-janitors+bounces-5504-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58097B2EA
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Sep 2024 18:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AFE228335E
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Sep 2024 16:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF6B17AE01;
	Tue, 17 Sep 2024 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iXGBTWeV"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB0EAD8;
	Tue, 17 Sep 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726590045; cv=none; b=mNXRjIO4g88vBHVskyhTCp+uIspkLS+QDrmrd+Q328y7iRObivLLnYk6K5MFuAXzOLVFzMjjKE+NstRG9BwGJiYkmjQ65HuMsMO+BX5hGkeD+OA/O2I3Ua5mjYZUs7oBaBR0rpy4nVs+Ire7hnsCuUGWLmLZZJHXXi8fFLy5tqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726590045; c=relaxed/simple;
	bh=yUig5GSW4JG8bHBEfj90dY/nd64XoMgE72xRv75LVz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMd3GKUPiy7SJwTF0dzR20xDuEjmJUHTDUJR40w1d7cXDAo6ju+Qkc9zALlUeXh1ZvIrsiEmxHzjUy5IuKQfHSCiOl+Y+6bTv2nv81RTzDhET0E2JJobDbOZBbVrGCsB5Jv8jf1ESaqpeb/sTnOE1y6KR9QC4EA2Cf6K6ofhFno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=iXGBTWeV; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wIyhiO5mY4s5u6quFh1+QMn0GcxK4WQPQ9Ffj4BXjsE=; b=iXGBTWeVVEDpoXTnJ0PRfft94m
	oMKPJOW4G4V3ofEMXZbDLWUUkFowabsHAMSBw9xNkAhJ+8l0B1JJaf5CIDhMBjIa3+1Uu2ziA9kcY
	pV1cG8/zRF24VdzXX4sJR5vfLIDzyYTXNvsSHvRXiGxvFHrF2xBDYH93NElz1y+CRlcqUG168Bt+l
	miyXZC2AcQOcgjyL4cSQcAGbhjYb6Nx13SHWI4uqXigPSye7BUZnYR9OGDVU321RiQB/kD2kMNRnw
	OoJ96/Xis9FecSidd89zRv8Xr6/QcVf7Z1EUHzWesdUYFUwKZZssJTGLeOD8/GScBzi8JrDseLVRI
	XzzMMWxw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57830)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sqawB-00076f-0H;
	Tue, 17 Sep 2024 17:20:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sqaw6-00087j-2j;
	Tue, 17 Sep 2024 17:20:18 +0100
Date: Tue, 17 Sep 2024 17:20:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Xu <peterx@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] arm/mm: fix typos
Message-ID: <ZumsQuGrUkBjZyZq@shell.armlinux.org.uk>
References: <20240909102907.9187-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909102907.9187-1-algonell@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 09, 2024 at 01:28:51PM +0300, Andrew Kreimer wrote:
> Fix typos in comments.
> 
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>

Not sure who's picking this up, but if the intention is for me, then
please make sure it finds its way to the patch system. One way to do
this is:

$ kvsn=$(git describe --abbrev=0 ...commit...)
$ git send-email --cc=patches@armlinux.org.uk \
	--add-header="KernelVersion: $kvsn" \
	...

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

