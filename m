Return-Path: <kernel-janitors+bounces-1846-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50A85F0ED
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 06:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B07D01F23D94
	for <lists+kernel-janitors@lfdr.de>; Thu, 22 Feb 2024 05:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2970F9CC;
	Thu, 22 Feb 2024 05:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ix51u0ti"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8479D0
	for <kernel-janitors@vger.kernel.org>; Thu, 22 Feb 2024 05:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708579506; cv=none; b=HJ589+B13A5R7yy4HW4Z+wzTUmSYWnTV7CIxirWS8XsKR5rdoY+cXU8vp3vEOTxJcQoueyxpc74ok+1B9mWyWLPfbcAl5praPL8elsVOWiiQDbL4UTT0v3lqpbsaGcfcLMZyYiKjyoTJilJ5h47svCmV+FddKayKFEc/qxcqzG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708579506; c=relaxed/simple;
	bh=8H/BzytqOZYzFjZacY932uXfieYnQyStCWl2l/du+ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a/FpctOqniGmRX27VnARkIvjWu+fPb0MJH3bg6zM+5PcrlQ6jYCdTogj1/oDyA+uHJ3veC5mONUu0V067OMr8xZH6YTzxFpGoMysYQ+1PcNDfOrd7g3Dc10A1oCuGmBi181KBwDLm8VRtwZlfI6CN1iPyaSfWCUMbsk9eMNUQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ix51u0ti; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3394b892691so231235f8f.1
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Feb 2024 21:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708579503; x=1709184303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8H/BzytqOZYzFjZacY932uXfieYnQyStCWl2l/du+ws=;
        b=ix51u0tiPc2BdlkZS3k/4vhnj5pk1TgWrLfxU9VZcC9OMdkLtAL1zTmT9mEmwT44/a
         uVVeCSQyE4g+3D08w1fV5LK+6r/T3hpZIEr7ae0gU4YtF0Od1LuevAeYT2FQYSA9yNFO
         tFVW+iHZ3P/oH2vwH7EoGWByWet7QGyalF7baflv09xeIRgavmq5SCXqD5GcWOR87BR0
         oYE708MaWijQ7ZlYAfPHiCoU9OKKsPPfBB+h3fM8BteFuPj4PqEYo/aC9IOCUU/zE9FR
         Mbf2OrBj2UTawxgAdxfvZTcuspg7td3MccE2vyR00lyw2yUut6VupJGX49hlwHQQpRft
         tbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708579503; x=1709184303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8H/BzytqOZYzFjZacY932uXfieYnQyStCWl2l/du+ws=;
        b=vT5Pxrvdc/HurXUhwJeU0Pzjel+3S5ale6pNp2JQZOp1mEEc9IqsxLcuepKIb3JVam
         fV669CSDtPKSDkZscj3vU9XxlW1OojeRSZ59T52uwWJK4XmuBIcpzSnbYMbxkF0SQCWC
         P5WNPKa5CJIwPS7I3QE5wYDaQxIQ2esEkrQgmE2vFoyhDNc1Dqcjjn1UuS0yso9+LfA2
         KiFa0ZImBTbqRGVD8Liudd+yk9TNkID3SZfRlZ3sJ9Dj+2ip4eILKaVvSq7mQy2+n3jb
         vuiRSyny5BT8PY/rF8UaOEkeIzog5WBAC6VlIbJ5FFix1rYBPRrzuDTiL7n/uhaXcUXO
         aACQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkrK2WAbYDewwlV5r0FhtqYjkoae6GB5cghCHEpGxHMLGgs0MBEv+V5s1lU7KaFnDmoGZUjBj68IzmejdsyCDYgDnPASF0bwqP+/H7288j
X-Gm-Message-State: AOJu0YzUuB7ka5yQbQcYrsKP95y2ykeAFi8p1bGk2r3NmlYFtCpbaOa6
	/lNCoClGBtvdZDaL3vIMujYPyDREOH9HY4w6+KUhI3CifGyKiVtTv0XOjdrQ4Dc=
X-Google-Smtp-Source: AGHT+IGccZ0j73/5DrOmMr+HWme+77iCv5MXgbQTR75Cls7ZJMbT2w/CLOu9Xq8tSwrznHtU3sy6jg==
X-Received: by 2002:a5d:4d8e:0:b0:33d:6fe1:8dc2 with SMTP id b14-20020a5d4d8e000000b0033d6fe18dc2mr1057619wru.3.1708579502807;
        Wed, 21 Feb 2024 21:25:02 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e2-20020a056000120200b0033cf80ad6f5sm18922729wrx.60.2024.02.21.21.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:25:02 -0800 (PST)
Date: Thu, 22 Feb 2024 08:24:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: "Colin King (gmail)" <colin.i.king@gmail.com>,
	Brian Foster <bfoster@redhat.com>, linux-bcachefs@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bcachefs: remove redundant assignment to variable
 ret
Message-ID: <bc2cef70-6adf-48cb-814c-a1087939ec17@moroto.mountain>
References: <20240221115203.3413554-1-colin.i.king@gmail.com>
 <3qaoftjgf7p2ugutl524b3yin7pqpjrkftjx3frunhduf3so66@tjhcdoq6unk3>
 <cfa4cd82-67e9-4483-9c35-a425859f4a21@gmail.com>
 <27hacgxfzyeatjx27nb4k5rb5cajt5yw4c2papfr4h64urb7qx@teo2ha6msqnl>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27hacgxfzyeatjx27nb4k5rb5cajt5yw4c2papfr4h64urb7qx@teo2ha6msqnl>

To be honest, the point of explaining how to run Smatch was really to
let you know that you're now on your own.

regards,
dan carpenter


