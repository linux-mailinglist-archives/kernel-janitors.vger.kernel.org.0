Return-Path: <kernel-janitors+bounces-3629-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A088FBFD1
	for <lists+kernel-janitors@lfdr.de>; Wed,  5 Jun 2024 01:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5191E28386F
	for <lists+kernel-janitors@lfdr.de>; Tue,  4 Jun 2024 23:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0EA14D710;
	Tue,  4 Jun 2024 23:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FAHOwFPB"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BB1411F3
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 23:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717543785; cv=none; b=eGu0s8DQAp9YX4cxlTmsm9LDKYDxUz0SGmXzT/EpqbMEQxIFZ9YN/QqhhmB1iI2cJKRjvO2e42C6Wj49iADZBEwARiYFLfgxrZe0bAiOiv+mllGEFg+lr1+Z7ADdDx7bGE2H24+b/Ak5dpl5Ff4T2xVT79dGGgXInJOuYLrkqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717543785; c=relaxed/simple;
	bh=NTOSuMKNlZjh5qgetQbTZmcQQXwN7LKuEZ9U+ZAncjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M3zabt0Kh4awONyb/DHB+N11w1jiSQo0r+RTjX5elwPmtqmgHVElXE7BoHNDc5Sr8mLuj1A2yHbLJw3iR4YNbxa/sbjZDkWqodrVDVywt43uc+N8y21i25EBvsEYTf5uut/GWmgZzptY8G0i1vrAqM7MIdhhYCmS+TEW/8FIbvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FAHOwFPB; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2c1e797cafcso309312a91.1
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 16:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717543783; x=1718148583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+x51aoZ4NK0amIZazvXbm1aes7UfC8U/R8eR/ud4gNI=;
        b=FAHOwFPBpFt4TnuPBq4x4DChftVHBms+jadKmPC/+JjLOBKc+YJ/WDB9renFGVBPtP
         HlOvJ3AQJ6OSLe0PsyPbBkzSeM6YC6QRD6QJ8pVRhw3/bTYgPFoSZPw+VDBGExIWSbk7
         dmpjYgD7aJ560Em5MhmYcnuEcbGMBGEXmGYF3oYsLi8szgSgyJ2eiVIHk4f1SL0d9eIs
         bB3Hy9gr/PII+4W6a2sW/6IV2N4SNkTOdI+9j+Ao4kev7d5t+B1dgROw97CjEik69iRd
         BjrpRUcQlBv1mG4k5FutNbJcEIfI24IrOLCXYYtyC0bbgvw5ZLEk/IjG7v32xY/UF19o
         vCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717543783; x=1718148583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+x51aoZ4NK0amIZazvXbm1aes7UfC8U/R8eR/ud4gNI=;
        b=eP+1Ml4FqmQHElHE2FEUn1kpO94QTNwsGwvFyNu3csP8yGNcyAF63ApmM6TFDx2/d0
         5ENimxxvWRRRqq/mmsGE7Of4fm9Y6m22EG0K+QWtQi3gdWgIv4JptW1D1AoQ6/eO30+B
         NwqoEP8lgvtjdxSDi/Ia9a7zPGQmFEB4dDcvhGZFpTvyemvcDKsd0D7q4X11tredPStz
         0UiHdBVoikzkjUxHwryGjNeLURMyFu7i45Z8zUMf1wkEuZLyMBKp+RRiDrWzI75HyP30
         50YU8KjpnRTV+kdBW4XdRiTXeSmiQ1sR1luA59KVCy8tLOflP670XOm1SrbisNgGETXA
         Vn0w==
X-Gm-Message-State: AOJu0YyEdUSWsSAjMW562Coo/kTYJiHBVoRgBaGSO4T2r8+6FT6/4bFx
	EVpI0+iQ5YeehuBO0jDlMQmj4zxiq4he8vFm4AqCz6i+zfiRthKLAmxHX49VUvFWbal3FLlPutF
	WnA==
X-Google-Smtp-Source: AGHT+IExrVGyDj4SjTJZG5rOMmcDDREj9vNkffe0To8EYFE5NS2MHwZ2u6aszqpJQHooWRE6WzCHGDpCCg0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:2309:b0:2b4:32df:9b7b with SMTP id
 98e67ed59e1d1-2c25300652fmr48774a91.1.1717543782991; Tue, 04 Jun 2024
 16:29:42 -0700 (PDT)
Date: Tue,  4 Jun 2024 16:29:17 -0700
In-Reply-To: <20240523154102.2236133-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240523154102.2236133-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <171754270332.2777568.8736329166014206290.b4-ty@google.com>
Subject: Re: [PATCH][next][V2] selftests: kvm: fix shift of 32 bit unsigned
 int more than 32 bits
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 23 May 2024 16:41:02 +0100, Colin Ian King wrote:
> Currrentl a 32 bit 1u value is being shifted more than 32 bits causing
> overflow and incorrect checking of bits 32-63. Fix this by using the
> BIT_ULL macro for shifting bits.
> 
> Detected by cppcheck:
> sev_init2_tests.c:108:34: error: Shifting 32-bit value by 63 bits is
> undefined behaviour [shiftTooManyBits]
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] selftests: kvm: fix shift of 32 bit unsigned int more than 32 bits
      https://github.com/kvm-x86/linux/commit/9a68cefe9f05

--
https://github.com/kvm-x86/linux/tree/next

