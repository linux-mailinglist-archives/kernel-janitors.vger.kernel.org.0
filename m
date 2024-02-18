Return-Path: <kernel-janitors+bounces-1776-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0988E859971
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Feb 2024 21:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8598DB20B5F
	for <lists+kernel-janitors@lfdr.de>; Sun, 18 Feb 2024 20:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650F873195;
	Sun, 18 Feb 2024 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cNSa8tXr"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [91.218.175.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B287604D
	for <kernel-janitors@vger.kernel.org>; Sun, 18 Feb 2024 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289882; cv=none; b=aNEsA90GC3DAVp+LldiVZIspqtctjVaCsbgeq+RhCxHFgaad7O9ujOTYdhEFynLvOrmNoigXfF5giimVwOCsQHGvieEdiTiJA67MvsGMVDPJGqom8suMsTivpYof2QEseLQDf47UYnjKsCtkAcD10St3fvyKkxgN+7Sfc83esDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289882; c=relaxed/simple;
	bh=R3BsKSBb4VGS4GVOpXyV+CdEBnSBq1bsunScPm8BKvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrQcFVQuhY7tv0FyonG2jm5KMW4Ky873zawQHqzPH/Rb22sl/PLdZ8wTg2cwtxEc7aLjzaks4gE/odpISjf+mL8vI6GDE4fSwgQX9bil7dVpXZGU3RzJrxhdBovo65MTjE9Hd1nWytabcKFaVaRxoO7nR5uHe+j2unuMyve11AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cNSa8tXr; arc=none smtp.client-ip=91.218.175.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 18 Feb 2024 15:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708289877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EdAwdrqq1gjopSy69bhrt8pxRsrhYgfK4y3CMVxelXU=;
	b=cNSa8tXrIg0K67WUJsYtKYxpEgNZ6dhvowvBSBxFGSSFh47PK200tMOTvcGy6T4MDO12q4
	lDWB/9TzyZXQSKiOAIy2981a0s/SzsT2u2XVS4/GeU/LBE3w8eYC23x5+wL18zHh2VZCUy
	hIR9xeQWwA5Rcmuay329tja3A9bGqro=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Brian Foster <bfoster@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-bcachefs@vger.kernel.org
Subject: Re: [PATCH v2] bcachefs: Avoid a potential useless over memory
 allocation in bch2_prt_[v]printf()
Message-ID: <g6wbkgivnpdsxbosmptshcveplxylfnfqsgg4e2xa4xiyrhuty@bxa3aayk4scc>
References: <4c614db674887346ea418acaeafd6bf86502ec77.1708272713.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c614db674887346ea418acaeafd6bf86502ec77.1708272713.git.christophe.jaillet@wanadoo.fr>
X-Migadu-Flow: FLOW_OUT

On Sun, Feb 18, 2024 at 05:12:28PM +0100, Christophe JAILLET wrote:
> 2 issues related to incorrect available space in the output buffer
> computation may lead to some extra memory allocation.
> 
> 
> First: vsnprintf() takes the size of the buffer, *including* the space for
> the trailing null.
> 
> But printbuf_remaining() returns the number of characters we can print
> to the output buffer, *excluding* the terminating null.
> 
> So, use printbuf_remaining_size(), which includes the space for the
> terminating null.
> 
> 
> Second: if the return value of vsnprintf() is greater than or equal to the
> passed size, the resulting string is truncated.
> So, in order to see if some extra space is needed, the check needs to be
> changed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, applied

