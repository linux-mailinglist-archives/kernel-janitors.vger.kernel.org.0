Return-Path: <kernel-janitors+bounces-2664-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9BD8AB894
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Apr 2024 03:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291CA281C15
	for <lists+kernel-janitors@lfdr.de>; Sat, 20 Apr 2024 01:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C636FB0;
	Sat, 20 Apr 2024 01:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8ZCJpEu"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFB524A;
	Sat, 20 Apr 2024 01:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713578207; cv=none; b=E3MNRFH/M1SOxcjG+Hsp5zwsteZtWJ55GNgzPm4mP0Qwo+S02ibW49OvcMd37aPoHvP6eENULoLcru98I4iSGgH+Aq6VzNnlQYVknkK8nX9vOoOqMnXEnFHCDNMU7L0DPXrmJFnVrTdR20LlHE6FaGrkXSk4xezySB+BoIh5FyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713578207; c=relaxed/simple;
	bh=aERJgvt2NrkTLPGOoaveQmF0rnRSZUUJv1EbpcJg+5E=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=sOyHJnCh7q2HxwBY3xpx7DDsiEEwMDTh64ycE+xGP2/G6RQfsprOqpTYOzYMz6SMuWesuUDLc7ouGcieJo9cHC2W2eAaqri23tOSrGYSi9spezDSGy/rX17Zgst7PB1iB6PobEMWKWHUQvra2N11BjcwMTMfJg3usMjj/zV2CZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8ZCJpEu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2C0C072AA;
	Sat, 20 Apr 2024 01:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713578207;
	bh=aERJgvt2NrkTLPGOoaveQmF0rnRSZUUJv1EbpcJg+5E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=B8ZCJpEuKloyK3gIKcZcAQdaUF6k9j3JPIZo4b4tbxdIE755P1grYDPjYMmL2W2wm
	 DP5QXst9tLPAfL3f4qZM/MKMWbuVUNTC3Qlzzstly1jZ30aJVRtqCirT0yRrhW/W//
	 1Ecka6PRNFge//QrfNtPDBzcuHV+HuEHL85nl7FsNh9XOWxg0yZqB0NR3D6OTe9Un2
	 X3EyLpz92EJ+hvF9U9e8YQdtYql7bDrPDoobTlgkB/L9pE6n885BLhiPozIeGdo4ee
	 tobFZWCo4fBbLpwbBugJmPZV+quHnkRxN2PCZH/DGTSacwT0QWaGt8kOawFrJcaW7L
	 RdA0dSWDvK5sA==
Message-ID: <473fa377de13bfeb909317a43aad0e00.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9f92330c717e6f2dab27b1307565ffb108c304a7.1713017032.git.christophe.jaillet@wanadoo.fr>
References: <9f92330c717e6f2dab27b1307565ffb108c304a7.1713017032.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: qcom: rpm: Remove an unused field in struct rpm_cc
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
To: Bjorn Andersson <andersson@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Michael Turquette <mturquette@baylibre.com>
Date: Fri, 19 Apr 2024 18:56:44 -0700
User-Agent: alot/0.10

Quoting Christophe JAILLET (2024-04-13 07:04:04)
> In "struct rpm_cc", the 'rpm' field is unused.
>=20
> Remove it.
>=20
> Found with cppcheck, unusedStructMember.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

