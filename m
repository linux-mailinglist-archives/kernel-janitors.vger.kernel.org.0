Return-Path: <kernel-janitors+bounces-3018-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 995768BF97F
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2024 11:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28DD1C214B0
	for <lists+kernel-janitors@lfdr.de>; Wed,  8 May 2024 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B8D7580B;
	Wed,  8 May 2024 09:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ei3BqE/P"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CADD74C08
	for <kernel-janitors@vger.kernel.org>; Wed,  8 May 2024 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715160029; cv=none; b=VF8fFi0EMHOv4hYIVeUb7wI2TlN1/3Hpl/1wlVHrdbdDwNKNPKwXlFPQG1tX/nbADaRSZRgyIBqyMy2NODpEtz0skJg8r69xO0KzVEff/9lTuQzUgU2dVy8TxmvuH+9YyDTdPoG8HWNCr0dSIqjTIkjHGxA2EeiWEv5/jPGXuC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715160029; c=relaxed/simple;
	bh=yKfqWildDBpRn3j/aQLboejYqWIQhfdprrcdr7mLdr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jY4LkBk6KNYJVjSEcpNIm1XFZ0HhwtsztYwczpCL+gb/JH+LtHKMGf3LT4N9qCBt37VPRMTo6pa6THsTlSayIWI1CkcObiDyTp4EItjLNVeeH1mC8KHTu0ThOrfDeQY+HGnu6Gajtu50ODEE9UaW1s3ZrslXs5hHR4w6wJ0HkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ei3BqE/P; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59ad344f7dso824983166b.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2024 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715160026; x=1715764826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XvuGnMD1Ah+tuwTUGBWHswEEMKL2KFH48xBYXc+VM8=;
        b=ei3BqE/PSo0Ze6nfudrXV+AGVhUpl5uCPNXWHQde5JTUkkhun9QoqF3bWU5z3tTOJA
         LkBvJ7cp3DS/IE+ptDRw00V1wujbtMlDBoifZGlN0Kspce3DqMMgn4oODS3YpEhNPEIR
         OdosdwD+D56YUhkWHovISFpkZoMikcDI3RcCGnt+SindLNWqqRROmZ2RBZ4QjbKwR09N
         Axx1R5TJhMV22cMsoDi2URq62P5r+VjduU14jFL3IBQImhJ9GCJTBRZVaeAMudogCoG8
         fTbQvqUp/E1wWJKBssDmDhb89/39CB0kr8dcl0HGD7pVPJM/vfQQjEV8Vesi0g+3yaVb
         W90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715160026; x=1715764826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XvuGnMD1Ah+tuwTUGBWHswEEMKL2KFH48xBYXc+VM8=;
        b=nGo2GFZXGWBwh0gwiMpwNU7OBaTL9p3P9MxwI56PEQOidUsWPRqAFHlbpcAYJqZ3Ae
         fwWxIBhMDs995ILb19CcrcHrCSyG0qon7hEhEqYZIe/oEe9dIHPqcNgkLZWaulzruupu
         FOoomjWZy3yPejra9JTJ/pgjIm8GtEaQ4g1a/sVKjep47dynUm6GhVUZPWL3N2x/u530
         zh/o0hNtAqGHASSpfHB+UlCekaQd4GcX5nCoIIEtjcuAoNqjVv/SGFxpKPeFwxxX5ZLm
         17nh1eG/u228tf4+/voylgvKMgkQgOgqALKhJdj2U7ZDHyakxB3yDc93QV6aT7LUEnm8
         dnfw==
X-Forwarded-Encrypted: i=1; AJvYcCVybPx7/6Uq/FefphN2fUga8ihqnbqIrgXJfk3sLk7i40lbHp28PNrtP/Ri6cafajVJc0EyXI0K+wOPksl8c/rayOGzS9bdmR4Xeux/u1Vq
X-Gm-Message-State: AOJu0Yyh+qeRDS1FhVnER5u2FLuDhaY8u1t+rARVhTREaqTAxg8wOb6P
	ieChBfrTls5QMfmpbtgT6EvbOHRfIV226lM+fZj+bsjlMBLV2K6eUZscBo0lyk4=
X-Google-Smtp-Source: AGHT+IHq2INOQdTZFtxvBQ4CNgUmxUKG/Y5YiCzni6VgE1Hb/kxqQiCsxPVeCX8iNNi6RQsuxFZCQw==
X-Received: by 2002:a17:906:c444:b0:a59:c28a:7ec2 with SMTP id a640c23a62f3a-a59fb95dc67mr115208566b.41.1715160026392;
        Wed, 08 May 2024 02:20:26 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906394300b00a599c1d46d5sm5967553eje.101.2024.05.08.02.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 02:20:25 -0700 (PDT)
Date: Wed, 8 May 2024 12:20:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Chinner <david@fromorbit.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	Chandan Babu R <chandan.babu@oracle.com>, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] xfs: check for negatives in xfs_exchange_range_checks()
Message-ID: <20137ff5-76a7-4b3d-96d9-9c6c90cbb063@moroto.mountain>
References: <0e7def98-1479-4f3a-a69a-5f4d09e12fa8@moroto.mountain>
 <ZjrVaynGeygNaDtQ@dread.disaster.area>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZjrVaynGeygNaDtQ@dread.disaster.area>

On Wed, May 08, 2024 at 11:29:15AM +1000, Dave Chinner wrote:
> On Sat, May 04, 2024 at 02:27:36PM +0300, Dan Carpenter wrote:
> > The fxr->file1_offset and fxr->file2_offset variables come from the user
> > in xfs_ioc_exchange_range().  They are size loff_t which is an s64.
> > Check the they aren't negative.
> > 
> > Fixes: 9a64d9b3109d ("xfs: introduce new file range exchange ioctl")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > From static analysis.  Untested.  Sorry!
> > 
> >  fs/xfs/xfs_exchrange.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/xfs/xfs_exchrange.c b/fs/xfs/xfs_exchrange.c
> > index c8a655c92c92..3465e152d928 100644
> > --- a/fs/xfs/xfs_exchrange.c
> > +++ b/fs/xfs/xfs_exchrange.c
> > @@ -337,6 +337,9 @@ xfs_exchange_range_checks(
> >  	if (IS_SWAPFILE(inode1) || IS_SWAPFILE(inode2))
> >  		return -ETXTBSY;
> >  
> > +	if (fxr->file1_offset < 0 || fxr->file2_offset < 0)
> > +		return -EINVAL;
> 
> Aren't the operational offset/lengths already checked for underflow
> and overflow via xfs_exchange_range_verify_area()?

Ah right.  Smatch complains in the middle of the two calls to
xfs_exchange_range_verify_area().  (It get's called in different places
depending on if the XFS_EXCHANGE_RANGE_TO_EOF flag is set).

regards,
dan carpenter


