Return-Path: <kernel-janitors+bounces-6116-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2145C9A0D08
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Oct 2024 16:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE5ACB24879
	for <lists+kernel-janitors@lfdr.de>; Wed, 16 Oct 2024 14:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4B520E004;
	Wed, 16 Oct 2024 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZV+0iG1"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349C720C03A
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089733; cv=none; b=emxLA+NBkP+JOJvGgzVNjHVJQwQaXXDuGa6x2IsKp3qzYdsGZPOJ+X2m0yHJRAh8KbhvOuOrnbRx3jlhJ+25v5kS74T+HWUbYvWxuxTofxRKGOXf215IKbqENNc0R5p+KsNDcQS9aDKkU/axuz6NcsC6cAAF6Mm+ON+4jNCjnpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089733; c=relaxed/simple;
	bh=ZpYrtK7MtUBEI/ZYVcQlR8ZVdajfCjo8jOMxyFfCLu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIke/IcCsJ/mPXmwE6xGUv8O+r65EL0Mhce13F2F6nUfWcA98Bhef6IfLR0OLuDpSweKJDok+bVzQdp0Ok01CbH+l81qlECPaM4uaFLR9xepnwzNsTUcO3uJ0/6ecy7zAz0tITBxHJ4lSSu4SXza3Akysht/ZiPKnybyb7tFoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZV+0iG1; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c96936065dso5001338a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729089730; x=1729694530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C/Xs71I9jBNZyAZ00FOHiyLsgfN1x+hSe7LFDe6cUfY=;
        b=pZV+0iG1JSzajbptQfeHKBAeTHGJ3Z0dZEgREh1Q7XIIiILAObn0H8ORUHl8by6EyM
         3OpJXPsAm3urWgw1Ww7t4nONnJrXXFLkf5DTolyS9QpqekimqxGA75KUmcFF8M85U7d4
         +RnJcnhMypxxyZVN0YWurcGs18YoVhm9PIbL61gYDcNHy+l8s5va/gb6Qj2d1A6XxQuc
         PzPqUemeVWVUUvQYLPjX9JmCfVBqRvBCP6AZLEfl5Se9rKx03yL7Lba2Z1Ekk5J+si+U
         Du+QyxO+zeJ5/IJ6AdYHH5HKvmKvv8210/XTXog7WwhLtXeupxBZZ5yzRwvUyFA0IGsO
         vEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729089730; x=1729694530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/Xs71I9jBNZyAZ00FOHiyLsgfN1x+hSe7LFDe6cUfY=;
        b=dRQ4zwJiDDW1IUjyqtfefIJH1Yl/gmuuRcCsWRn+rhOnLApbs7WOZ2hksB2BKP3TBh
         +UsR1bdghB4YTspxNCPgooaojJSb+I7A1CR5Ts20uEZ42oecXLB6YnseHuEPs3xXY/1D
         rpOSF80c7Aq0XkE2Ae/Ksqf4TrQez4Qa90uUnv01bXuCygpU5Y2Ejjd2r2K0Aj3mLQv4
         iNzVXhAiI8GZdBk+1JlcpuAkK2vzpE2jD/Vp/OOg37D1zYdd+LNerxw7ZbTF+LErNguV
         BwDJL9/Uj02QJOyj3Q4/XYvqi7rMF7OtthFipdnl+YuYZbrffjN8Rur2FzgKfh1f+KWO
         CUrg==
X-Forwarded-Encrypted: i=1; AJvYcCWkOnaAEhv41rWZoboBNjC21bOzB26og0zw2PTSpDN6bN19L0Dg9lVciBSBgUsAZFK+J5+FNPg/dyfCNE44edA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3Galtjzx562437J4kFFczmQLO0eMF6Zy/2r439C6WcEiqaZ4
	5dKgoAgqKL+OsQvKMp1erp+/1D5i4LydpOFfDSWeCdukYmjXS8w2RPLcqeGwaZvKPAlLXo6cpOr
	C
X-Google-Smtp-Source: AGHT+IGWcI4tfnDXcGH4X5+Vm2QybBCvnU53W1Fc4QZtYSFr0ttLHY/etEUDYKHSJtlqb6b6Fb7RtQ==
X-Received: by 2002:a05:6402:2695:b0:5c9:709c:247f with SMTP id 4fb4d7f45d1cf-5c9709c9a2emr10927291a12.2.1729089730331;
        Wed, 16 Oct 2024 07:42:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c98d5042f7sm1823649a12.42.2024.10.16.07.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:42:09 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:42:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Everest K.C." <everestkc@everestkc.com.np>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4][next] Bluetooth: btintel_pcie: Remove structrually
 deadcode
Message-ID: <e22aebb2-0961-459c-bc02-3165c364115b@stanley.mountain>
References: <20241015232212.19242-1-everestkc@everestkc.com.np>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015232212.19242-1-everestkc@everestkc.com.np>

On Tue, Oct 15, 2024 at 05:22:05PM -0600, Everest K.C. wrote:
> The switch case statement has a default branch. Thus, the return
> statement at the end of the function can never be reached.
> Fix it by removing the return statement at the end of the
> function.
> 
> This issue was reported by Coverity Scan.
> 
> Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
> V3 -> V4: - Fixed typo in the subject

I don't like to be the typo police but, no, you didn't fix the typo.  :P

regards,
dan carpenter


