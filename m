Return-Path: <kernel-janitors+bounces-4190-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530E490F5AC
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2024 20:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E26BB283658
	for <lists+kernel-janitors@lfdr.de>; Wed, 19 Jun 2024 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA7E156F39;
	Wed, 19 Jun 2024 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPdT6fyN"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA9482495;
	Wed, 19 Jun 2024 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718820246; cv=none; b=dbLnhWR6LdGjT2UUQesmJYxTN5Tl+i9R1K4ClxpT90kfOkk4KgONclM8l+Le4Tv9TQRX4uGXmqG2zTFDOPOgr8DHIxZoagfpW9PSADqu7iD81oyOKhxWATyX89excm7LbnbslXh7vyt6VJVhrGPujaSTvPOOViBiPzvmDp/tUIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718820246; c=relaxed/simple;
	bh=XSJGzwnMP7/mSnZuqR21fiSMQ3ycEz0SjVtRDxfBWrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j10g8nFzupyBbFF++L1s1qUaqnKeAyc1YXlt/Cb+S7R2hp9LFUDxk0JqZwhF9WA835lu49vwjESnRNgveuWLg2ThPO6Q6smeBCE9TITw6iNQIKCTQ0gTeaL1klqjlIcKhnhQrUZNXOggTlXCTCoUgZYt455gfEtOuvprWxvff4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPdT6fyN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E77FC2BBFC;
	Wed, 19 Jun 2024 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718820245;
	bh=XSJGzwnMP7/mSnZuqR21fiSMQ3ycEz0SjVtRDxfBWrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPdT6fyNyjcsS/AZeGVcEcx8NxC3cxs4sIlDsLGeTEj8+yTVyFRSLd/AiAcLE7879
	 v6OvH4QE/MvNJSwfgvmXgh/kXyFaZTPhPPI1wINmQFzJWTG0Ey+9xv2311UUwRsT6V
	 57/yPCjli4u1doNqwVIPMh/40kXjV+Vq36eY43dwhDafBmjG6dBtvm71XT+J0RF6X1
	 yrt5GAEVle/HyFXYMOCDvU3rh21ndrsn/EOeisxc1VFs7Ycw66FmElNQoxJuZ4Kubg
	 dTn+3vf/uHWON7nUXSuM4r8We2X8W6ZDUtey2CKXFTRlAOT3TXGBHdK3r0PXJgtO+Y
	 KANEzWaeX34Ag==
Date: Wed, 19 Jun 2024 19:04:02 +0100
From: Simon Horman <horms@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: arcnet: com20020-isa: add missing
 MODULE_DESCRIPTION() macro
Message-ID: <20240619180402.GS690967@kernel.org>
References: <20240618-md-m68k-drivers-net-arcnet-v1-1-90e42bc58102@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-md-m68k-drivers-net-arcnet-v1-1-90e42bc58102@quicinc.com>

On Tue, Jun 18, 2024 at 09:53:44AM -0700, Jeff Johnson wrote:
> With ARCH=m68k, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com20020-isa.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Simon Horman <horms@kernel.org>

nit: I notice a number of similar patches for net-next.
     Please consider bundling similar patches for net-next
     in a patch-set in future.

