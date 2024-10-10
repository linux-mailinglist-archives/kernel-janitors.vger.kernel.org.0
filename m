Return-Path: <kernel-janitors+bounces-5978-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74789994B4
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Oct 2024 23:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4CF1F24A9C
	for <lists+kernel-janitors@lfdr.de>; Thu, 10 Oct 2024 21:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E82D1E47CE;
	Thu, 10 Oct 2024 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Yhs7w8LH"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07A19A2A3
	for <kernel-janitors@vger.kernel.org>; Thu, 10 Oct 2024 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728597146; cv=none; b=VYjpWQdukKP6SdHcM1GrUapc5ZopUm8X/mtNrVn50Wtfx3OjPff/OoLIzNGTseH3aOjt3CVZpdo3IfV9gYWyhiQ0oEggutRto/szrR2UhP8Ul8XdOHedGBA9Bldr9X5MsILjBUWlzH8JGXfXM675WNRcdlxiiqC78ECCoJZRDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728597146; c=relaxed/simple;
	bh=WAu2X9b0jDIlw7lYMLRAf5KhZ1VHRSFcIumgJWzFBlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blO5MgMIemg3HXPu3z8ZyMiXnBmgl6NF5b6K+diWw4C22V8YDTKqX0WFlNYJPPukfSo2V20j+Z5UMQS16khF+9SUxCfPrVE1xkUzhrHfwzLX0jan+6rJ9aR3Z2JJl5zhlPKhTnpiOdi8RElEyJBbLz32QjPdHbjHY16USIKSV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Yhs7w8LH; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Thu, 10 Oct 2024 17:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728597141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CfqRvVZ7yaWX6z/yUFY6whDPAJmAFk8EJGLq8dpIsG4=;
	b=Yhs7w8LHaV0FMh8DpReGx9AO6f9vFweuZwSL271vuzWFXxcit+UbjByTA37i68GmvdaXjj
	7vUAGFWrUHNhByeKUPLCfZ6Dqi7bME22e60nbRAu64178SPd88AJqYelWC8DbAwc5zvnwq
	iWNHOSJfWchZK/78Jm1kSdmIdd84ZmU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-bcachefs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] bcachefs: Fix bitwise math on 32 bit systems
Message-ID: <wmdklwq2z6z2ssrwq3z4inxtgzvq3dwk2l3a4yxln3gillcfcq@eeitm7jievjw>
References: <78e06425-2c26-4977-97eb-577ce8268d2a@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78e06425-2c26-4977-97eb-577ce8268d2a@stanley.mountain>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 10, 2024 at 09:35:53PM GMT, Dan Carpenter wrote:
> The ~0UL needs to be ~0ULL for this mask and shift to work correctly on
> 32 bit systems.
> 
> Fixes: bad8626ae088 ("bcachefs: CONFIG_BCACHEFS_INJECT_TRANSACTION_RESTARTS")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thanks! Applied.

