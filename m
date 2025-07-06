Return-Path: <kernel-janitors+bounces-8498-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D35AF0237
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Jul 2025 19:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0554E1C1D
	for <lists+kernel-janitors@lfdr.de>; Tue,  1 Jul 2025 17:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72659280329;
	Tue,  1 Jul 2025 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qalaK46T"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A927FD49;
	Tue,  1 Jul 2025 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392514; cv=none; b=uXWvm/2gWnNQnAdaEoN6zxJ9ThDiPArwVMUT/VaxIHF6yO+du61XJ1WLP8QaLk3iGWtrU1jfUrGu9wgSSjLYkwKFZH9pukQkTyuBOTO9zPyZkv8ygYJUg66mMeOdkQaCWkmyHwi0vLf7DMZR39uZ+F/X6p80KxcTOlQoDUcRqQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392514; c=relaxed/simple;
	bh=TCbCy9L3A07ZCr9iKwHm92TG1ST+qQiZGm1XbthtBss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PsM6j35oIYCse3JZoOBDouEBrzKJks8Oz6qOWxxxomGW/aapJ1xNjmV6Wqs27iJu61wUBLJwzFCYmezWNymG5ggESu6ovolM4zhIRwdNtHN3VmfUOGLVSss1rCNvXKOzh5OBWU3hQx3Ow4ay23zOBju/PRraFGwFtluAD2poQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qalaK46T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B70BC4CEF1;
	Tue,  1 Jul 2025 17:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751392514;
	bh=TCbCy9L3A07ZCr9iKwHm92TG1ST+qQiZGm1XbthtBss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qalaK46TA70WN0i8heveEXSMsEulSmDFGZ6VMOtwadJBQb/arGIrp48kazmyBvTDW
	 m4YRe5j6Yv76y9UyhahsqkTv7AKgO3EOREh4J0/62bb+TYpgch49xgAAcqt3I0jsWe
	 qM+ZQEzvQVflL5SxgSO3AlKIqioh0RVtj+PdNetkXEcjul1PrI3rhe7QEDylRYkLM0
	 2+dfvR2Hs9EZkrFiWJ6R0VK+RRVjpvLwx2k0mMZ//A8ny/1w5EnAWZPwsMfXRxpl9n
	 J7YTOKHNWWKJvxryjx7iddyR7tlQOz2KeQtKJJZ7IsrEHHJK/h+sBEO3NFV7J/VhFK
	 jQ6KQFmF7RHSg==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, kan.liang@linux.intel.com, 
 linux-perf-users@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250630125128.562895-1-colin.i.king@gmail.com>
References: <20250630125128.562895-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] perf drm_pmu: Fix spelling mistake "bufers" ->
 "buffers"
Message-Id: <175139251407.738306.16912833047654066565.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 10:55:14 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2

On Mon, 30 Jun 2025 13:51:28 +0100, Colin Ian King wrote:
> There are spelling mistakes in some literal strings. Fix these.
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



