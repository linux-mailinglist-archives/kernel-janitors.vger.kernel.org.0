Return-Path: <kernel-janitors+bounces-1779-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB5859B1B
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 04:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A1511C21913
	for <lists+kernel-janitors@lfdr.de>; Mon, 19 Feb 2024 03:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A32146B1;
	Mon, 19 Feb 2024 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jNpxQQUQ"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFC65226
	for <kernel-janitors@vger.kernel.org>; Mon, 19 Feb 2024 03:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708314178; cv=none; b=Au4pqyP4JU1XFYLExmfn3z2DaI5EmYYZl9E3VmgeNaB86c8eS+3+eQRWMYlvsy3EPrmVX67r93Ig6OMl5r0rpIp6/kS/1aHtiZO16GnqyZBs1drqGmMJQm3mM3/yo+fH16Cd7SusTyb9E+hnKF42+uGasVnFHV4i1hReIhdFDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708314178; c=relaxed/simple;
	bh=roIxuG/Ac9DQVq9EUiZ8Mru2gszw1mNDmxOgzDSP9QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXQzFmLdc+e5DJrjqNiafbWaWIjHLrue0RWX3no0AAu9O1KV6X/pt3TYHutDjFg0ax0q3Mm8NVKurTyRKkAZ92AjK5g4TWzn2RXzMnN+0+4j7u0DCBE/l201uvfus7cgE80c9SVk8sKC4UvKqI5hmx7lprGL3iejBE5RGZWqbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jNpxQQUQ; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sun, 18 Feb 2024 22:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708314174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fMBwARP4Q4ySTt1H8X84ni9Xt4iLGGrdNJSUec9FL+w=;
	b=jNpxQQUQKEVNBEBOdIDkyxwFAIIM9CZNvveIFMdOMcaqnlnjV4FoVu+Omcf3UXyxLyCcde
	AMUmEAJNsNPNND7LAkSchxqb+XkajW8hp/69uVAHTZ5+xP8gohWMjkdUu9RMoiKNcUXOsN
	Ad9lqXrQUHAV6Al7D+AKg+SS5YOYAWk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Brian Foster <bfoster@redhat.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-bcachefs@vger.kernel.org
Subject: Re: [PATCH v2] bcachefs: Avoid a potential useless over memory
 allocation in bch2_prt_[v]printf()
Message-ID: <o3wahdwbcpktshcblnbbf2bkmf6omtmf42xzprjtg627vpcbf7@bagppe6ucens>
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

btw, the patch was suspect to begin with

in cases where off-by-one errors are difficult to avoid, but harmless in
one direction - just over allocate.

