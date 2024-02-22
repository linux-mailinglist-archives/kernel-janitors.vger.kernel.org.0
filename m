Return-Path: <kernel-janitors+bounces-1852-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C6085F188
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 07:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218AD283E9E
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 06:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F9217981;
	Thu, 22 Feb 2024 06:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SGuqGhHB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAABEF519
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 06:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708583855; cv=none; b=RVNCVW6fsY3aXRP8q0gHIqoOk4QKMuJphwsHkUa0GEOOfeRwYlY2T7I4lLMYO7mJt9HxkTyjqI1RsNYhKfPnBDZ2HPRhNqxk/1uOxhux8J4Nn3461p0zlVT8AQBsEG01YWL598tQkpvSIxOtOGMs3yMcwR2INLLzVAXPo5oJq3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708583855; c=relaxed/simple;
	bh=H1T1rtiL3ukjs2Pa9U+gg05nNixcKqbl4iEhlh2rPkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWLxZ6tSJrLZoUmvZ7Ps0oAb/7LIWWFz5Zg6guRC+87JJn3mEPsfjLaXHtJD6XPzv9SdBaAoX3Rn0cpouZa0W16TGck+4zFE5KSakIFnAQTyh9+IvyVyWT6ae2R/NwCobN1c/T0rGURvwr2kv8UpHYcQifWaT+wiCCUCx6TvLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SGuqGhHB; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 22 Feb 2024 01:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708583852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H1T1rtiL3ukjs2Pa9U+gg05nNixcKqbl4iEhlh2rPkU=;
	b=SGuqGhHBVEewyFRscZjjuIqkOmsvfP6p4PRh5FdTERZIXS0sEJdCCRX3dLbslmmXi2cAMG
	EtM2SfUYTVyTA91RtFRZ1i/05hpmqwZTF0sRzSnDaiPSJ2AK1ERQ+Et8fk5UFHUXRw7XQX
	rWDks/nT2FPEbOuLcjLF3Wh11KZn4SA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>, 
	Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bcachefs: remove redundant assignment to variable
 ret
Message-ID: <v2ug5zf4cukb4ttcglhqkvc6jalmp22sn4533gcrea2ekpepdo@qdqou5453ykb>
References: <20240221115203.3413554-1-colin.i.king@gmail.com>
 <3qaoftjgf7p2ugutl524b3yin7pqpjrkftjx3frunhduf3so66@tjhcdoq6unk3>
 <cfa4cd82-67e9-4483-9c35-a425859f4a21@gmail.com>
 <27hacgxfzyeatjx27nb4k5rb5cajt5yw4c2papfr4h64urb7qx@teo2ha6msqnl>
 <bc2cef70-6adf-48cb-814c-a1087939ec17@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc2cef70-6adf-48cb-814c-a1087939ec17@moroto.mountain>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 22, 2024 at 08:24:58AM +0300, Dan Carpenter wrote:
> To be honest, the point of explaining how to run Smatch was really to
> let you know that you're now on your own.

Ok that's fine - in that case, I just need to ask you to stop bugging me
to get me to explain smatch bugs to you.

