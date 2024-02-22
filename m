Return-Path: <kernel-janitors+bounces-1841-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A715C85EDC6
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 01:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6280B284D56
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 00:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E43DA923;
	Thu, 22 Feb 2024 00:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BVCFB3Qn"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74CFEDC
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 00:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708560798; cv=none; b=qNNdVHagj+aPQYnA76DFxKUqxxzPHjYYPRVegDi2NE2iEcxJL7deBH713tYypNos5K4YXyEFUlH+2S7ENSZNf+6p2FYn+C3hoK3CepA0r+BlsGe5bHlgldJVcb9t6Vn9u2duONli708xK9N5u03jGpqezpWttnwTKtjrAn4VzbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708560798; c=relaxed/simple;
	bh=iUVWUF9NkdrHOfQDIfPkftj/GJ/E6lO+EKObpVPf634=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iqg2r2TOomNFXVykok86U9kSyVFPFBA9LgGEW7xoeX4YzdXHuKUrsJQKOqsI3bmVXs7zwgqCAUneQJZ0KWGMssBF2XEjJapQGAZPsLIcA/OoIeftem82Q5uVvvKjKVHLhN99fsLf0ZCjpYxnPjHvAZCiUG2MXlELSNh9n0YXbqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BVCFB3Qn; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 21 Feb 2024 19:13:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1708560795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DMHLnyzhcN8vf6iG1IKFZXAcocDG2xngD5mV3RGx+c=;
	b=BVCFB3QnnSsV6YcYDk3XQRAF6CwNL1RSt46ymfCNlUPryJ2e1DhklXaqKS/wmxS1ei03ee
	g/fOundriHURen1VughVUN9rg1SEunNP6VvbfK2iVnr5us4mzitB7DjnHo+J7l28wZsFYR
	gYbJ1Epul/iyk/9wkhxWIEoN3zQ1Hxc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bcachefs: remove redundant assignment to variable
 ret
Message-ID: <27hacgxfzyeatjx27nb4k5rb5cajt5yw4c2papfr4h64urb7qx@teo2ha6msqnl>
References: <20240221115203.3413554-1-colin.i.king@gmail.com>
 <3qaoftjgf7p2ugutl524b3yin7pqpjrkftjx3frunhduf3so66@tjhcdoq6unk3>
 <cfa4cd82-67e9-4483-9c35-a425859f4a21@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfa4cd82-67e9-4483-9c35-a425859f4a21@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Feb 22, 2024 at 12:08:28AM +0000, Colin King (gmail) wrote:
> On 22/02/2024 00:04, Kent Overstreet wrote:
> > On Wed, Feb 21, 2024 at 11:52:03AM +0000, Colin Ian King wrote:
> > > Variable ret is being assigned a value that is never read, it is
> > > being re-assigned a couple of statements later on. The assignment
> > > is redundant and can be removed.
> > > 
> > > Cleans up clang scan build warning:
> > > fs/bcachefs/super-io.c:806:2: warning: Value stored to 'ret' is
> > > never read [deadcode.DeadStores]
> > > 
> > > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> > 
> > I'll take this, but - entirely too much of the traffic on this list is
> > getting taken up by static analyzer bullshit, we need to cut down on
> > this
> 
> I'll back off then.

Maybe just wrap up fixes for all the warnings every now and then? It is
worth keeping up on static analyzer warnings, it's just the mailing list
noise I want to cut down on, as well as making better use of my own
time.

I'd be happy to take a patch like that now and then, or - maybe we could
get a dashboard going, like I was just running by Dan in the other
thread? If we could get a dirt simple stupid dashboard that had both the
clangc analyzer warnings, and the smatch warnings - I think that would
make a lot of people happy.

