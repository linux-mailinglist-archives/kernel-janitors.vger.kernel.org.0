Return-Path: <kernel-janitors+bounces-508-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A89287FE832
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Nov 2023 05:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63783281FA1
	for <lists+kernel-janitors@lfdr.de>; Thu, 30 Nov 2023 04:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D831641F;
	Thu, 30 Nov 2023 04:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VcdQj8LE"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B65681A5;
	Wed, 29 Nov 2023 20:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ciUUDyS6UwVOmfcKRVNErpTKeITmISSd1ZTQAam+P4Y=; b=VcdQj8LE7sb+q+PxGpYs9UlZRY
	a11xy9N2IbqlspcfzGHIiVFK/PaZJsXVyWbxIVBfys+cXQEQ8O1aJenrL9CtmvAePK8G6EeZTCB1Y
	Z2dC+VRv1L1/V+r07n3UsLYmmASvKt63s43YZUxJvikd8jCF7cFhh7NZHsgLuKNZ+Raanf1J6xeOj
	lyEbROpRKnQzlvrKQk9Wye65azyjyn1CLFtzJdXEGqm8Qj/qezo+e/Vi3vNkbtDCsnnPgu8aC0a5D
	iVO9rMulaBKZkyj/biE9tU3PMBrCqf880ZWL1NcOXPFQQbn3cyTsSrzIoAmNf2JWjB6Pa/t2IJRTJ
	myxQHmXw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r8YSQ-00E4dE-37; Thu, 30 Nov 2023 04:15:22 +0000
Date: Thu, 30 Nov 2023 04:15:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Su Hui <suhui@nfschina.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	akpm@linux-foundation.org, fmdefrancesco@gmail.com,
	ira.weiny@intel.com, tony.luck@intel.com, jiaqiyan@google.com,
	pcc@google.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] highmem: fix a memory copy problem in memcpy_from_folio
Message-ID: <ZWgMWricKKnwhWPh@casper.infradead.org>
References: <20231130034017.1210429-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130034017.1210429-1-suhui@nfschina.com>

On Thu, Nov 30, 2023 at 11:40:18AM +0800, Su Hui wrote:
> Clang static checker complains that value stored to 'from' is never read.
> And memcpy_from_folio() only copy the last chunk memory from folio to
> destination.
> Using 'to += chunk' to replace 'from += chunk' to fix this typo problem.
> 
> Fixes: b23d03ef7af5 ("highmem: add memcpy_to_folio() and memcpy_from_folio()")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

