#ifndef __P2G_KERNELS_CUH_
#define __P2G_KERNELS_CUH_
#include <cuda_runtime.h>
#include <stdint.h>
#include <Setting.h>

namespace mn {
    
    __global__ void P2G_FLIP(
        const int numParticle, const int* d_targetPages, const int* d_virtualPageOffsets, 
        const int** smallest_nodes, const T* d_sigma,
        int* d_block_offsets, int* d_cellids, int* d_indices, int* d_indexTrans,
        T** d_sorted_positions, T* d_sorted_masses, T** d_sorted_velocities, T** d_channels,
        int** d_adjPage);

    __global__ void P2G_APIC(
        const int numParticle, const int* d_targetPages, const int* d_virtualPageOffsets, 
        const int** smallest_nodes, const T* d_sigma,
        int* d_block_offsets, int* d_cellids, int* d_indices, int* d_indexTrans,
        T** d_sorted_positions, T* d_sorted_masses, T** d_sorted_velocities, T* d_B, T** d_channels,
        int** d_adjPage);

    __global__ void P2G_MLS(
        const int numParticle, const int* d_targetPages, const int* d_virtualPageOffsets, 
        const int** smallest_nodes, const T* d_sigma,
        int* d_block_offsets, int* d_cellids, int* d_indices, int* d_indexTrans,
        T** d_sorted_positions, T* d_sorted_masses, T** d_sorted_velocities, T* d_B, const T dt,
        T** d_channels, int** d_adjPage, uint64_t* d_pageOffsets);

    __global__ void P2G_Implicit(
		const int numParticle, const int* d_targetPages, const int* d_virtualPageOffsets, 
        const int** smallest_nodes, int* d_block_offsets, 
        int* d_cellids, T** d_sorted_positions, 
        T* d_sorted_masses, T** d_sorted_velocities, T** d_channels, int** d_adjPage, T* d_dP, T** d_force);
      
    __global__ void P2G_Implicit_MLS(
		const int numParticle, const int* d_targetPages, const int* d_virtualPageOffsets, 
        const int** smallest_nodes, int* d_block_offsets, 
        int* d_cellids, T** d_sorted_positions, 
        T* d_sorted_masses, T** d_sorted_velocities, T** d_channels, int** d_adjPage, T* d_dP, T** d_force);  

}

#endif
