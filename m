Return-Path: <kernel-janitors+bounces-4502-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF22992949F
	for <lists+kernel-janitors@lfdr.de>; Sat,  6 Jul 2024 17:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 908961F22C3F
	for <lists+kernel-janitors@lfdr.de>; Sat,  6 Jul 2024 15:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9072413B2A2;
	Sat,  6 Jul 2024 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJ8pW5Cg"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121060275
	for <kernel-janitors@vger.kernel.org>; Sat,  6 Jul 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720280472; cv=none; b=QNk79AYUzalFvtBsVVpAY0v3MI7qiPsHZrsp8f6YcyOfWijh7MbuBQ0w8g/nMI6JWqpRYQLELTPdyj4K/LHE56jLsJk9mMSgr966AXSpcvdifu+J9l0djHKbxE4o7F9Bq8gxM2RnB7WooY47+Lgz58tRrtzgdthA4uqbsFfYY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720280472; c=relaxed/simple;
	bh=M9jRDBpbXwZ4EmwaQHnuGlnqvEpiyG3lM49RlqDVwbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PhOJwsvcE4Od2DGNWkd6XcSZoBvdGMWsJ6QSqmUxzceiqQ4EeAdAVo7uKjkCnWY4hAdXdN8I2iol3qJ0Pb/ans55UkXKwKoEUUye1+xu8/MMDxcei56jvpQvRy5zbZ12bfG0enfdGIiADar9Zkm9mz0SWDB0enNQsiHmZzyjscU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJ8pW5Cg; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: dan.carpenter@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1720280466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHyX+ItlOF80ZtMIh6eOxVSUOn43OMD99j3+D49eFXM=;
	b=BJ8pW5CgQiMSF9nGLg3xKq2Nn38oV8dpQ+4hEKBu8lC+ozyGcn7toD/hvL5perN/YhKSbi
	i0koOgsQf6LzOsG+xd0U6r/OKJYYatMPoFak7BHcVKr/FZvGu44FBscUah4Sk+89qr5rzP
	iMqBP8zvY4LLUCbgFtjJrZtx6hvZBs4=
X-Envelope-To: brauner@kernel.org
X-Envelope-To: ast@kernel.org
X-Envelope-To: daniel@iogearbox.net
X-Envelope-To: andrii@kernel.org
X-Envelope-To: martin.lau@linux.dev
X-Envelope-To: eddyz87@gmail.com
X-Envelope-To: song@kernel.org
X-Envelope-To: john.fastabend@gmail.com
X-Envelope-To: kpsingh@kernel.org
X-Envelope-To: sdf@fomichev.me
X-Envelope-To: haoluo@google.com
X-Envelope-To: jolsa@kernel.org
X-Envelope-To: bpf@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: kernel-janitors@vger.kernel.org
Message-ID: <40958285-12dc-4beb-8085-53f0bb35a989@linux.dev>
Date: Sat, 6 Jul 2024 08:40:55 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] bpf: remove unnecessary loop in
 task_file_seq_get_next()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <ZoWJF51D4zWb6f5t@stanley.mountain>
Content-Language: en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <ZoWJF51D4zWb6f5t@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 7/4/24 8:19 AM, Dan Carpenter wrote:
> After commit 0ede61d8589c ("file: convert to SLAB_TYPESAFE_BY_RCU") this
> loop always iterates exactly one time.  Delete the for statement and pull
> the code in a tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

LGTM. Thanks for the cleanup.

Acked-by: Yonghong Song <yonghong.song@linux.dev>


