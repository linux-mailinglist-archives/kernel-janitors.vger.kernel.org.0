Return-Path: <kernel-janitors+bounces-855-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BEA81E5FC
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Dec 2023 09:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E561F22695
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Dec 2023 08:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AE84D10D;
	Tue, 26 Dec 2023 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WCX2dK3c"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEADC4CE18;
	Tue, 26 Dec 2023 08:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=WCX2dK3c21ywFwIQ97bs4s4Ede
	oaZFu97Q92Tulhra3vpDt3XVb7q/q2xfEx9Pc4od5hjmjBDjJoXGv7i/I7kVWXJiDQVNrPJdLTpRn
	cQVGJLGlwWt1N/LE8oIOaFY29t1Jp+6EZKYjLuEstzpkcX80uOgfeswp7cgoPD5s2MQNZeByKMWq+
	TP4jsqLuzcz8RdNUbjh2T/r7AxvRCgmmxCIKKoqm78IxJ7YcZCxeeMaZKz2RjEAorae63NnyFvXSl
	VanR0m0B8sFtXfgLGO9NfSLLt3/waGkjV7BpTwDQfcHNdSMPdrf8QLAZXHqMy/LDfoEDrI2RU1/Gw
	AbxZph0Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rI2z8-00Bv1f-0Q;
	Tue, 26 Dec 2023 08:40:22 +0000
Date: Tue, 26 Dec 2023 00:40:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH] block: Fix a memory leak in bdev_open_by_dev()
Message-ID: <ZYqRdrZEnKLEB3Mu@infradead.org>
References: <8eaec334781e695810aaa383b55de00ca4ab1352.1703439383.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eaec334781e695810aaa383b55de00ca4ab1352.1703439383.git.christophe.jaillet@wanadoo.fr>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

